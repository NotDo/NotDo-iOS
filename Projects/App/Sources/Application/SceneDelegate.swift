import UIKit
import Moordinator
import RootFeature

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    private let moordinatorWorker = MoordinatorWorker()
    private let rootRouter = RootRouter()

    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        guard let scene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: scene)
        let rootMoordinator = AppDelegate.container.resolve(RootMoordinator.self, argument: window)!
        moordinatorWorker.coordinate(moordinator: rootMoordinator, with: rootRouter)
        self.window = window
        print("111")
    }

    func sceneDidDisconnect(_ scene: UIScene) {

    }

    func sceneDidBecomeActive(_ scene: UIScene) {

    }

    func sceneWillResignActive(_ scene: UIScene) {

    }

    func sceneWillEnterForeground(_ scene: UIScene) {

    }

    func sceneDidEnterBackground(_ scene: UIScene) {

    }

}
