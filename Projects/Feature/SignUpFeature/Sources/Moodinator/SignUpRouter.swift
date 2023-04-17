import Combine
import Moordinator
import SignUpFeatureInterface

final class SignUpRouter: Router {
    let route: PassthroughSubject<any RoutePath, Never> = .init()
    var initialPath: RoutePath {
        SignUpRoutePath.signUp
    }
}
