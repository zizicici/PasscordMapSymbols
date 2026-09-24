#!/usr/bin/env swift

import Foundation

// Regenerate after changing a Material Symbol or the sticker's two-point edge:
// swift Scripts/generate_sticker_vectors.swift Sources/PasscordMapSymbols/Resources/MapNoteSymbols.xcassets

private let materialPrefix = "MapNoteMaterial"
private let stickerPrefix = "MapNoteSticker"
private let symbolSide = 16.0
private let canvasSide = 22.0
private let inset = 3.0
private let edgeWidth = 2.0
private let manager = FileManager.default

private func run(_ executable: String, _ arguments: [String]) throws {
    let process = Process()
    process.executableURL = URL(fileURLWithPath: "/usr/bin/env")
    process.arguments = [executable] + arguments
    var environment = ProcessInfo.processInfo.environment
    environment["SOURCE_DATE_EPOCH"] = "0"
    process.environment = environment
    try process.run()
    process.waitUntilExit()
    guard process.terminationStatus == 0 else {
        throw NSError(
            domain: "PasscordMapSymbolsGenerator",
            code: Int(process.terminationStatus),
            userInfo: [NSLocalizedDescriptionKey: "\(executable) failed"]
        )
    }
}

private func capture(_ pattern: String, in text: String) throws -> String {
    let expression = try NSRegularExpression(pattern: pattern)
    let range = NSRange(text.startIndex..<text.endIndex, in: text)
    guard let match = expression.firstMatch(in: text, range: range),
          let result = Range(match.range(at: 1), in: text) else {
        throw NSError(
            domain: "PasscordMapSymbolsGenerator",
            code: 1,
            userInfo: [NSLocalizedDescriptionKey: "SVG does not contain \(pattern)"]
        )
    }
    return String(text[result])
}

guard CommandLine.arguments.count == 2 else {
    fatalError("Pass the MapNoteSymbols.xcassets directory")
}
let root = URL(fileURLWithPath: CommandLine.arguments[1], isDirectory: true)
let sources = try manager.contentsOfDirectory(
    at: root,
    includingPropertiesForKeys: nil
).filter {
    $0.lastPathComponent.hasPrefix(materialPrefix) && $0.pathExtension == "imageset"
}.sorted { $0.lastPathComponent < $1.lastPathComponent }

let temp = manager.temporaryDirectory.appendingPathComponent(
    "passcord-sticker-vectors-\(UUID().uuidString)",
    isDirectory: true
)
try manager.createDirectory(at: temp, withIntermediateDirectories: true)
defer { try? manager.removeItem(at: temp) }

let pathExpression = try NSRegularExpression(pattern: #"<path\b[^>]*>"#)
for source in sources {
    let name = source.deletingPathExtension().lastPathComponent
    let stickerName = stickerPrefix + name.dropFirst(materialPrefix.count)
    let svgURL = temp.appendingPathComponent("source.svg")
    let pdfURL = source.appendingPathComponent("symbol.pdf")
    try run("pdftocairo", ["-svg", pdfURL.path, svgURL.path])
    let sourceSVG = try String(contentsOf: svgURL, encoding: .utf8)
    let viewBox = try capture(#"viewBox="0 0 ([0-9.]+) [0-9.]+""#, in: sourceSVG)
    guard let sourceSide = Double(viewBox), sourceSide > 0 else {
        fatalError("Invalid viewBox in \(name)")
    }
    let sourceRange = NSRange(sourceSVG.startIndex..<sourceSVG.endIndex, in: sourceSVG)
    let pathTags = pathExpression.matches(in: sourceSVG, range: sourceRange)
    guard !pathTags.isEmpty else { fatalError("No vector paths in \(name)") }
    let scale = symbolSide / sourceSide
    let strokeWidth = edgeWidth * 2 / scale
    let paths = try pathTags.flatMap { match -> [String] in
        guard let range = Range(match.range, in: sourceSVG) else {
            fatalError("Invalid path range in \(name)")
        }
        let path = String(sourceSVG[range])
        let data = try capture(#"\bd="([^"]+)""#, in: path)
        guard data.hasPrefix("M") else {
            fatalError("Expected absolute SVG subpaths in \(name)")
        }
        // Each closed contour is filled separately. The original compound
        // path uses reversed contours to cut out eyes and windows; keeping it
        // intact would let the map show through those holes.
        return data.split(separator: "M").map { fragment in
            let contour = "M" + fragment.trimmingCharacters(in: .whitespaces)
            return """
            <path d="\(contour)" fill="white" stroke="white" stroke-width="\(strokeWidth)" stroke-linecap="round" stroke-linejoin="round"/>
            """
        }
    }.joined(separator: "\n")
    let stickerSVG = """
    <svg xmlns="http://www.w3.org/2000/svg" width="\(canvasSide)pt" height="\(canvasSide)pt" viewBox="0 0 \(canvasSide) \(canvasSide)">
      <g transform="translate(\(inset) \(inset)) scale(\(scale))">
        \(paths)
      </g>
    </svg>
    """
    let stickerSVGURL = temp.appendingPathComponent("sticker.svg")
    try stickerSVG.write(to: stickerSVGURL, atomically: true, encoding: .utf8)
    let destination = root.appendingPathComponent("\(stickerName).imageset")
    try manager.createDirectory(at: destination, withIntermediateDirectories: true)
    try run("rsvg-convert", [
        "--format", "pdf",
        "--output", destination.appendingPathComponent("sticker.pdf").path,
        stickerSVGURL.path
    ])
    let contents = """
    {
      "images" : [
        {
          "filename" : "sticker.pdf",
          "idiom" : "universal"
        }
      ],
      "info" : {
        "author" : "xcode",
        "version" : 1
      },
      "properties" : {
        "preserves-vector-representation" : true
      }
    }
    """
    try contents.write(
        to: destination.appendingPathComponent("Contents.json"),
        atomically: true,
        encoding: .utf8
    )
}
print("Generated \(sources.count) vector sticker backings")
