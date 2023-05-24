import Moordinator

struct SignInFactoryImpl: SignInFactory {
    func makeMoordinator() -> Moordinator {
        let signInStore = SignInStore()
        let signInViewController = SignInViewController(store: signInStore)
        return SignInMoordinator(
            signInViewController: signInViewController
        )
    }
}
