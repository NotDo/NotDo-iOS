import DesignSystem
import Moordinator
import UIKit
import IntroFeatureInterface
import SignUpFeatureInterface

final class IntroMoordinator: Moordinator {
    private let rootVC = UINavigationController()
    let router: any Router
    private let introViewController: IntroViewController
    private let signUpFactory: SignUpFactory

    init(
        router: IntroRouter,
        introViewController: IntroViewController,
        signUpFactory: SignUpFactory
    ) {
        self.router = router
        self.introViewController = introViewController
        self.signUpFactory = signUpFactory
    }

    var root: Presentable {
        rootVC
    }

    func route(to path: RoutePath) -> MoordinatorContributors {
        guard let path = path as? IntroRoutePath else { return .none }
        switch path {
        case .intro:
            rootVC.setViewControllers([introViewController], animated: true)
        case .signUp:
            let viewController = signUpFactory.makeViewController(router: router)
            rootVC.pushViewController(viewController, animated: true)
            return .one(.contribute(viewController))
        default:
            return .none
        }
        return .none
    }
}
