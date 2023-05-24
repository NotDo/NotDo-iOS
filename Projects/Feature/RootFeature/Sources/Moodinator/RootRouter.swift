import Combine
import BaseFeature
import Moordinator

public final class RootRouter: Router {
    public init() {}
    public let route: PassthroughSubject<any RoutePath, Never> = .init()
    public var initialPath: RoutePath {
        NotDoRoutePath.splash
    }
}
