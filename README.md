# PasscordMapSymbols

An iOS Swift Package framework for Passcord map note symbols. It contains 343
Material Symbols Rounded icons (342 visible in the picker) and matching white
sticker backgrounds. Both layers are vector PDF assets, so a sticker stays
sharp when its view is resized.

```swift
import PasscordMapSymbols

let symbol = MapNoteSymbol.birdwatching
let view = MapNoteSymbolView(symbol: symbol, color: .systemOrange)
view.configure(symbol: .flight, color: .systemBlue)

let glyph = symbol.image                  // Tintable template image
let backing = symbol.stickerBackgroundImage // White, original rendering
let storedID = symbol.rawValue            // Stable database identifier
```

`MapNoteSymbolCategory.allCases` supplies 17 curated picker groups: transport,
travel and stays, meals and cooking, drinks and desserts, sports and fitness,
outdoor sports, nature, arts and culture, games and leisure, work and study,
shopping and services, home and family, health and wellness, places and
buildings, people and feelings, symbols and marks, and weather and sky.
Each selectable symbol belongs to exactly one group. Group order is for
browsing only; saved notes and favorites continue to use the symbol's stable
`rawValue`.

The white backgrounds have a two-point round edge around a 16-point glyph on
a 22-point canvas. To regenerate them after changing an icon or edge width,
install `pdftocairo` and `rsvg-convert`, then run:

```sh
swift Scripts/generate_sticker_vectors.swift Sources/PasscordMapSymbols/Resources/MapNoteSymbols.xcassets
```

The source icons are licensed under Apache License 2.0. See
`ThirdPartyNotices/MaterialSymbols-LICENSE.txt` and
`ThirdPartyNotices/MaterialSymbols-Sources.md`.
