import Combine
import Moordinator
import SignInFeatureInterface

final class SignInRouter: Router {
    let route: PassthroughSubject<any RoutePath, Never> = .init()
    var initialPath: RoutePath {
        SignInRoutePath.signIn
    }
}
