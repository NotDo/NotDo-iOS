import Moordinator
import SignInFeatureInterface

struct SignInFactoryImpl: SignInFactory {
    func makeMoordinator() -> Moordinator {
        let signInRouter = SignInRouter()
        let signInStore = SignInStore(
            router: signInRouter
        )
        let signInViewController = SignInViewController(store: signInStore)
        return SignInMoordinator(
            router: signInRouter,
            signInViewController: signInViewController
        )
    }
}
