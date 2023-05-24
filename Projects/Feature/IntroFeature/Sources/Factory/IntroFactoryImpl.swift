import Moordinator
import SignUpFeature

struct IntroFactoryImpl: IntroFactory {
    private let signUpFactory: any SignUpFactory

    init(
        signUpFactory: any SignUpFactory
    ) {
        self.signUpFactory = signUpFactory
    }

    func makeMoordinator() -> Moordinator {
        let introStore = IntroStore()
        let introViewController = IntroViewController(store: introStore)
        return IntroMoordinator(
            introViewController: introViewController,
            signUpFactory: self.signUpFactory
        )
    }
}
