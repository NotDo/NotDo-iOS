import UIKit

public extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach(self.addSubview(_:))
    }
}
