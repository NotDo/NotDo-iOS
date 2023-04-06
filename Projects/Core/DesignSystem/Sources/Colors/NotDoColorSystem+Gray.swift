import UIKit

public extension UIColor.NotDoColorSystem {
    enum Gray: NotDoColorable {
        case gray100
        case gray200
        case gray300
        case gray400
        case gray500
        case gray600
    }
}

public extension UIColor.NotDoColorSystem.Gray {
    var color: UIColor {
        switch self {
        case .gray100: return DesignSystemAsset.Gray.gray100.color
        case .gray200: return DesignSystemAsset.Gray.gray200.color
        case .gray300: return DesignSystemAsset.Gray.gray300.color
        case .gray400: return DesignSystemAsset.Gray.gray400.color
        case .gray500: return DesignSystemAsset.Gray.gray500.color
        case .gray600: return DesignSystemAsset.Gray.gray600.color
        }
    }
}
