import Combine
import Moordinator
import UIKit
import RootFeatureInterface

public final class RootMoordinator: Moordinator {
    private let window: UIWindow
    private lazy var rootVC: UIViewController = {
        let viewController = UIViewController()
        viewController.view.backgroundColor = .white
        return viewController
    }()
    public let router: any Router = RootRouter()

    public var root: Presentable {
        rootVC
    }

    public init(
        window: UIWindow
    ) {
        self.window = window
        window.rootViewController = rootVC
        window.makeKeyAndVisible()
    }

    public func route(to path: RoutePath) -> MoordinatorContributors {
        guard let path = path as? RootRoutePath else { return .none }
        switch path {
        case .auth:
            return .none

        case .main:
            return .none
        }
    }
}
