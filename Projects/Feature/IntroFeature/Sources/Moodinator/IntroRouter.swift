import Combine
import Moordinator
import IntroFeatureInterface

final class IntroRouter: Router {
    let route: PassthroughSubject<any RoutePath, Never> = .init()
    var initialPath: RoutePath {
        IntroRoutePath.intro
    }
}
