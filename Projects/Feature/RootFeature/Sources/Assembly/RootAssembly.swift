import RootFeatureInterface
import IntroFeatureInterface
import Swinject

public final class RootAssembly: Assembly {
    public init() { }
    public func assemble(container: Container) {
        container.register(RootMoordinator.self) { resolver, window in
            RootMoordinator(
                window: window,
                introFactory: resolver.resolve(IntroFactory.self)!
            )
        }
    }
}
