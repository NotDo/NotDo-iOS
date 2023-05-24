import Combine
import Moordinator
import UIKit
import IntroFeature
import BaseFeature

public final class RootMoordinator: Moordinator {
    private let window: UIWindow
    private let introFactory: any IntroFactory
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
        window: UIWindow,
        introFactory: any IntroFactory
    ) {
        self.window = window
        self.introFactory = introFactory
        window.rootViewController = rootVC
        window.makeKeyAndVisible()
    }

    public func route(to path: RoutePath) -> MoordinatorContributors {
        print("1112")
        guard let path = path.asNotDo else { print(path); return .none }
        switch path {
        case .splash:
            print("111")
            let introMoodinator = introFactory.makeMoordinator()
            Moord.use(introMoodinator) { root in
                self.window.rootViewController = root
                UIView.transition(
                    with: self.window,
                    duration: 0.3,
                    options: .transitionCrossDissolve,
                    animations: nil,
                    completion: nil
                )
            }
            return .one(.contribute(withNextPresentable: introMoodinator, withNextRouter: DisposableRouter(singlePath: NotDoRoutePath.splash)))

        default:
            print("asdf")
            return .none
        }
    }
}
