import UIKit

public extension UIColor.NotDoColorSystem {
    enum System: NotDoColorable {
        case blur
        case error
    }
}

public extension UIColor.NotDoColorSystem.System {
    var color: UIColor {
        switch self {
        case .blur: return DesignSystemAsset.System.blur.color
        case .error: return DesignSystemAsset.System.error.color
        }
    }
}
