import UIKit

public final class NotDoIconView: UIImageView {
    public enum IconSize: Equatable {
        case `default`
        case custom(CGSize)
    }

    @Invalidating(.layout) public var size: IconSize = .default

    public init(size: IconSize = .default) {
        self.size = size
        super.init(frame: .zero)
        setIconSize()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public override func layoutSubviews() {
        super.layoutSubviews()
        setIconSize()
    }
}

private extension NotDoIconView {
    func setIconSize() {
        self.widthAnchor.constraint(equalToConstant: size.width).isActive = true
        self.heightAnchor.constraint(equalToConstant: size.height).isActive = true
    }
}

private extension NotDoIconView.IconSize {
    var width: CGFloat {
        switch self {
        case .default: return 24
        case let .custom(size): return size.width
        }
    }

    var height: CGFloat {
        switch self {
        case .default: return 24
        case let .custom(size): return size.height
        }
    }
}
