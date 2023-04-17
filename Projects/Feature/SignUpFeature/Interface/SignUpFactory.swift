import Moordinator
import UIKit

public protocol SignUpFactory {
    func makeViewController(router: any Router) -> UIViewController
}
