import DesignSystem
import Moordinator
import UIKit
import SignUpFeatureInterface

final class SignUpMoordinator: Moordinator {
    private let rootVC = UINavigationController()
    let router: any Router
    private let signUpViewController: SignUpViewController

    init(
        router: SignUpRouter,
        signUpViewController: SignUpViewController
    ) {
        self.router = router
        self.signUpViewController = signUpViewController
    }

    var root: Presentable {
        rootVC
    }

    func route(to path: RoutePath) -> MoordinatorContributors {
        guard let path = path as? SignUpRoutePath else { return .none }
        switch path {
        case .signUp:
            rootVC.pushViewController(signUpViewController, animated: true)
//        case .findPassword:
//            rootVC.pushViewController(<#T##viewController: UIViewController##UIViewController#>, animated: <#T##Bool#>)
        default:
            return .none
        }
        return .none
    }
}
