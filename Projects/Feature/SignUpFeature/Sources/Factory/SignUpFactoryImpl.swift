import Moordinator
import SignUpFeatureInterface

struct SignUpFactoryImpl: SignUpFactory {
    func makeMoordinator() -> Moordinator {
        let signUpRouter = SignUpRouter()
        let signUpStore = SignUpStore(
            router: signUpRouter
        )
        let signUpViewController = SignUpViewController(store: signUpStore)
        return SignUpMoordinator(
            router: signUpRouter,
            signUpViewController: signUpViewController
        )
    }
}
