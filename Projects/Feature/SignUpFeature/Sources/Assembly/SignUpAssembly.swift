import Swinject

public final class SignUpAssembly: Assembly {
    public init() { }
    public func assemble(container: Container) {
        container.register(SignUpFactory.self) { _ in
            SignUpFactoryImpl()
        }
    }
}
