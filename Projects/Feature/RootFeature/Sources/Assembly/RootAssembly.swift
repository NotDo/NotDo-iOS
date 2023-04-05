import RootFeatureInterface
import Swinject

public final class RootAssembly: Assembly {
    public init() { }
    public func assemble(container: Container) {
        container.register(RootMoordinator.self) { _, window in
            RootMoordinator(
                window: window
            )
        }
    }
}
