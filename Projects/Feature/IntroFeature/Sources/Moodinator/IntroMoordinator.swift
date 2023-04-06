import DesignSystem
import Moordinator
import UIKit
import IntroFeatureInterface

final class IntroMoordinator: Moordinator {
    private let rootVC = UINavigationController()
    let router: any Router
    private let introViewController: IntroViewController

    init(
        router: IntroRouter,
        introViewController: IntroViewController
    ) {
        self.router = router
        self.introViewController = introViewController
    }

    var root: Presentable {
        rootVC
    }

    func route(to path: RoutePath) -> MoordinatorContributors {
        guard let path = path as? IntroRoutePath else { return .none }
        switch path {
        case .intro:
            rootVC.setViewControllers([introViewController], animated: true)
        default:
            return .none
        }
        return .none
    }
}
