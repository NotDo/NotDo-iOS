import DesignSystem
import Moordinator
import UIKit
import SignUpFeature
import BaseFeature

final class IntroMoordinator: Moordinator {
    private let rootVC = UINavigationController()
    private let introViewController: IntroViewController
    private let signUpFactory: SignUpFactory

    init(
        introViewController: IntroViewController,
        signUpFactory: SignUpFactory
    ) {
        self.introViewController = introViewController
        self.signUpFactory = signUpFactory
    }

    var root: Presentable {
        rootVC
    }

    func route(to path: RoutePath) -> MoordinatorContributors {
        guard let path = path as? NotDoRoutePath else { return .none }
        switch path {
        case .splash:
            rootVC.setViewControllers([introViewController], animated: true)
        case .signup:
            let viewController = signUpFactory.makeViewController()
            rootVC.pushViewController(viewController, animated: true)
            return .one(.contribute(withNextPresentable: viewController))
        default:
            return .none
        }
        return .none
    }
}
