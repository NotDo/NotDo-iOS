import UIKit

public extension UIColor {
    enum NotDoColorSystem {
        case gray(Gray)
        case main(Main)
        case sub(Sub)
        case system(System)
    }

    static func notDo(_ style: NotDoColorSystem) -> UIColor {
        switch style {
        case let .gray(colorable as NotDoColorable),
            let .main(colorable as NotDoColorable),
            let .sub(colorable as NotDoColorable),
            let .system(colorable as NotDoColorable):
            return colorable.color
        }
    }
}
