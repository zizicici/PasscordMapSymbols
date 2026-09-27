import UIKit

/// A vector-backed sticker with a freely tintable Material Symbol.
public final class MapNoteSymbolView: UIView {
    public static let defaultSize = CGSize(width: 22, height: 22)

    /// Set for a fixed-size glyph inside a sticker; nil keeps proportional scaling.
    public var fixedGlyphInset: CGFloat? {
        didSet { setNeedsLayout() }
    }

    private let backingView = UIImageView()
    private let symbolView = UIImageView()
    private var hdrBackingLayer: CALayer?
    private var hdrMaskLayer: CALayer?
    private var backingImage: UIImage?
    private var maskSize: CGSize = .zero
    private var maskScale: CGFloat = 0
    private var maskNeedsUpdate = true

    public init(symbol: MapNoteSymbol, color: UIColor) {
        super.init(frame: CGRect(origin: .zero, size: Self.defaultSize))
        isOpaque = false
        backingView.contentMode = .scaleAspectFit
        symbolView.contentMode = .scaleAspectFit
        symbolView.tintAdjustmentMode = .normal
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
            dx: fixedGlyphInset ?? bounds.width * 3 / Self.defaultSize.width,
            dy: fixedGlyphInset ?? bounds.height * 3 / Self.defaultSize.height
        )
        if #available(iOS 26.0, *), let hdrBackingLayer, let hdrMaskLayer {
            hdrBackingLayer.frame = bounds
            hdrMaskLayer.frame = bounds
            updateHDRMaskIfNeeded()
        }
    }

    public func configure(symbol: MapNoteSymbol, color: UIColor) {
        backingImage = symbol.stickerBackgroundImage
        maskNeedsUpdate = true
        updateBackingAppearance()
        symbolView.image = symbol.image
        symbolView.tintColor = color
    }

    /// Recolor the glyph without rebuilding the sticker's HDR backing.
    public func updateColor(_ color: UIColor) {
        symbolView.tintColor = color
    }

    private func updateBackingAppearance() {
        if #available(iOS 26.0, *) {
            backingView.image = backingImage
            backingView.isHidden = true
            if hdrBackingLayer == nil {
                let hdrBackingLayer = CALayer()
                let hdrMaskLayer = CALayer()
                layer.insertSublayer(hdrBackingLayer, below: symbolView.layer)
                hdrBackingLayer.mask = hdrMaskLayer
                self.hdrBackingLayer = hdrBackingLayer
                self.hdrMaskLayer = hdrMaskLayer
            }
            hdrBackingLayer?.isHidden = false
            hdrBackingLayer?.backgroundColor = UIColor(
                red: 1, green: 1, blue: 1, alpha: 1, linearExposure: 1.5
            ).cgColor
            hdrBackingLayer?.preferredDynamicRange = .high
            setNeedsLayout()
        } else {
            backingView.image = backingImage
            backingView.isHidden = false
            hdrBackingLayer?.isHidden = true
        }
    }

    private func updateHDRMaskIfNeeded() {
        guard let backingImage, let hdrMaskLayer,
              bounds.width > 0, bounds.height > 0 else { return }
        let scale = max(window?.screen.scale ?? traitCollection.displayScale, 3)
        guard maskNeedsUpdate || maskSize != bounds.size || maskScale != scale else { return }
        let format = UIGraphicsImageRendererFormat()
        format.opaque = false
        format.scale = scale
        let image = UIGraphicsImageRenderer(size: bounds.size, format: format).image { _ in
            backingImage.draw(in: CGRect(origin: .zero, size: bounds.size))
        }
        hdrMaskLayer.contents = image.cgImage
        hdrMaskLayer.contentsScale = scale
        maskSize = bounds.size
        maskScale = scale
        maskNeedsUpdate = false
    }
}
