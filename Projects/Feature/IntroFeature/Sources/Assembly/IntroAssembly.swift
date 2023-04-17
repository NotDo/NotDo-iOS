import Swinject
import IntroFeatureInterface
import SignUpFeatureInterface

public final class IntroAssembly: Assembly {
    public init() { }
    public func assemble(container: Container) {
        container.register(IntroFactory.self) { resolver in
            IntroFactoryImpl(
                signUpFactory: resolver.resolve(SignUpFactory.self)!
            )
        }
    }
}
