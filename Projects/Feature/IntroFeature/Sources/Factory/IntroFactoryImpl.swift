import Moordinator
import IntroFeatureInterface
import SignUpFeatureInterface

struct IntroFactoryImpl: IntroFactory {
    private let signUpFactory: any SignUpFactory

    init(
        signUpFactory: any SignUpFactory
    ) {
        self.signUpFactory = signUpFactory
    }

    func makeMoordinator() -> Moordinator {
        let introRouter = IntroRouter()
        let introStore = IntroStore(
            router: introRouter
        )
        let introViewController = IntroViewController(store: introStore)
        return IntroMoordinator(
            router: introRouter,
            introViewController: introViewController,
            signUpFactory: self.signUpFactory
        )
    }
}
