import Swinject
import IntroFeatureInterface

public final class IntroAssembly: Assembly {
    public init() { }
    public func assemble(container: Container) {
        container.register(IntroFactory.self) { _ in
            IntroFactoryImpl()
        }
    }
}
