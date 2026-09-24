// swift-tools-version: 5.10

import PackageDescription

let package = Package(
    name: "PasscordMapSymbols",
    platforms: [.iOS(.v16)],
    products: [
        .library(name: "PasscordMapSymbols", targets: ["PasscordMapSymbols"])
    ],
    targets: [
        .target(
            name: "PasscordMapSymbols",
            resources: [.process("Resources")]
        )
    ]
)
