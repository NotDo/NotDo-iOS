import DesignSystem
import Moordinator
import UIKit
import SignInFeatureInterface

final class SignInMoordinator: Moordinator {
    private let rootVC = UINavigationController()
    let router: any Router
    private let signInViewController: SignInViewController

    init(
        router: SignInRouter,
        signInViewController: SignInViewController
    ) {
        self.router = router
        self.signInViewController = signInViewController
    }

    var root: Presentable {
        rootVC
    }

    func route(to path: RoutePath) -> MoordinatorContributors {
        guard let path = path as? SignInRoutePath else { return .none }
        switch path {
        case .signIn:
            rootVC.setViewControllers([signInViewController], animated: true)
        default:
            return .none
        }
        return .none
    }
}
