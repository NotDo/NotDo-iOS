import DesignSystem
import BaseFeature
import Moordinator
import UIKit

final class SignUpMoordinator: Moordinator {
    private let rootVC = UINavigationController()
    private let signUpViewController: SignUpViewController

    init(
        signUpViewController: SignUpViewController
    ) {
        self.signUpViewController = signUpViewController
    }

    var root: Presentable {
        rootVC
    }

    func route(to path: RoutePath) -> MoordinatorContributors {
        guard let path = path as? NotDoRoutePath else { return .none }
        switch path {
        case .signup:
            rootVC.pushViewController(signUpViewController, animated: true)
//        case .findPassword:
//            rootVC.pushViewController(<#T##viewController: UIViewController##UIViewController#>, animated: <#T##Bool#>)
        default:
            return .none
        }
        return .none
    }
}
