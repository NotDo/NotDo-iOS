import UIKit

public extension UIColor.NotDoColorSystem {
    enum Main: NotDoColorable {
        case black
        case white
    }
}

public extension UIColor.NotDoColorSystem.Main {
    var color: UIColor {
        switch self {
        case .black: return DesignSystemAsset.Main.black.color
        case .white: return DesignSystemAsset.Main.white.color
        }
    }
}
