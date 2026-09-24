# PasscordMapSymbols

An iOS Swift Package framework for Passcord map note symbols. It contains 179
Material Symbols Rounded icons and matching white sticker backgrounds. Both
layers are vector PDF assets, so a sticker stays sharp when its view is resized.

```swift
import PasscordMapSymbols

let symbol = MapNoteSymbol.birdwatching
let view = MapNoteSymbolView(symbol: symbol, color: .systemOrange)
view.configure(symbol: .flight, color: .systemBlue)

let glyph = symbol.image                  // Tintable template image
let backing = symbol.stickerBackgroundImage // White, original rendering
let storedID = symbol.rawValue            // Stable database identifier
```

`MapNoteSymbolCategory.allCases` supplies the curated picker groups.

The white backgrounds have a two-point round edge around a 16-point glyph on
a 22-point canvas. To regenerate them after changing an icon or edge width,
install `pdftocairo` and `rsvg-convert`, then run:

```sh
swift Scripts/generate_sticker_vectors.swift Sources/PasscordMapSymbols/Resources/MapNoteSymbols.xcassets
```

The source icons are licensed under Apache License 2.0. See
`ThirdPartyNotices/MaterialSymbols-LICENSE.txt` and
`ThirdPartyNotices/MaterialSymbols-Sources.md`.
