import Swinject

public final class SignInAssembly: Assembly {
    public init() { }
    public func assemble(container: Container) {
        container.register(SignInFactory.self) { _ in
            SignInFactoryImpl()
        }
    }
}
