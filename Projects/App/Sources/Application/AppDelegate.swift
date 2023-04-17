import UIKit
import RootFeature
import IntroFeature
import SignInFeature
import SignUpFeature
import Swinject

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    static let container = Container()
    var assembler: Assembler!

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        assembler = Assembler([
            RootAssembly(),
            IntroAssembly(),
            SignInAssembly(),
            SignUpAssembly()
        ], container: AppDelegate.container)
        return true
    }

    // MARK: UISceneSession Lifecycle
    func application(
        _ application: UIApplication,
        configurationForConnecting connectingSceneSession: UISceneSession,
        options: UIScene.ConnectionOptions
    ) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(
        _ application: UIApplication,
        didDiscardSceneSessions sceneSessions: Set<UISceneSession>
    ) {

    }

}
