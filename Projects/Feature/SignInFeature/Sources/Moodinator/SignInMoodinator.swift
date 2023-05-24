import DesignSystem
import BaseFeature
import Moordinator
import UIKit

final class SignInMoordinator: Moordinator {
    private let rootVC = UINavigationController()
    private let signInViewController: SignInViewController

    init(
        signInViewController: SignInViewController
    ) {
         self.signInViewController = signInViewController
    }

    var root: Presentable {
        rootVC
    }

    func route(to path: RoutePath) -> MoordinatorContributors {
        guard let path = path as? NotDoRoutePath else { return .none }
        switch path {
        case .signin:
            rootVC.pushViewController(signInViewController, animated: true)
        default:
            return .none
        }
        return .none
    }
}
