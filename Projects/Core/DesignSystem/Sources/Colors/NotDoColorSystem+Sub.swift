import UIKit

public extension UIColor.NotDoColorSystem {
    enum Sub: NotDoColorable {
        case angry
        case gray
        case happy
        case normal
        case sad
    }
}

public extension UIColor.NotDoColorSystem.Sub {
    var color: UIColor {
        switch self {
        case .angry: return DesignSystemAsset.Sub.angry.color
        case .gray: return DesignSystemAsset.Sub.grey.color
        case .happy: return DesignSystemAsset.Sub.happy.color
        case .normal: return DesignSystemAsset.Sub.normal.color
        case .sad: return DesignSystemAsset.Sub.sad.color
        }
    }
}
