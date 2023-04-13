import UIKit

public extension NSMutableAttributedString {
    func semiBold(string: String) -> NSMutableAttributedString {
        let font = UIFont.notDo(.caption1SemiBold)
        let attributes: [NSAttributedString.Key: Any] = [.font: font]
        self.append(NSAttributedString(string: string, attributes: attributes))
        return self
    }

    func regular(string: String) -> NSMutableAttributedString {
        let font = UIFont.notDo(.caption1Regular)
        let attributes: [NSAttributedString.Key: Any] = [.font: font]
        self.append(NSAttributedString(string: string, attributes: attributes))
        return self
    }
}
