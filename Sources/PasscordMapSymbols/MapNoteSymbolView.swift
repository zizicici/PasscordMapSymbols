import UIKit

/// A vector-backed sticker with a freely tintable Material Symbol.
public final class MapNoteSymbolView: UIView {
    public static let defaultSize = CGSize(width: 22, height: 22)

    private let backingView = UIImageView()
    private let symbolView = UIImageView()

    public init(symbol: MapNoteSymbol, color: UIColor) {
        super.init(frame: CGRect(origin: .zero, size: Self.defaultSize))
        isOpaque = false
        backingView.contentMode = .scaleAspectFit
        symbolView.contentMode = .scaleAspectFit
        backingView.isUserInteractionEnabled = false
        symbolView.isUserInteractionEnabled = false
        addSubview(backingView)
        addSubview(symbolView)
        configure(symbol: symbol, color: color)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public override var intrinsicContentSize: CGSize { Self.defaultSize }

    public override func layoutSubviews() {
        super.layoutSubviews()
        backingView.frame = bounds
        symbolView.frame = bounds.insetBy(
            dx: bounds.width * 3 / Self.defaultSize.width,
            dy: bounds.height * 3 / Self.defaultSize.height
        )
    }

    public func configure(symbol: MapNoteSymbol, color: UIColor) {
        backingView.image = symbol.stickerBackgroundImage
        symbolView.image = symbol.image
        symbolView.tintColor = color
    }
}
