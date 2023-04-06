import Moordinator
import IntroFeatureInterface

struct IntroFactoryImpl: IntroFactory {
    func makeMoordinator() -> Moordinator {
        let introRouter = IntroRouter()
        let introStore = IntroStore(
            router: introRouter
        )
        let introViewController = IntroViewController(store: introStore)
        return IntroMoordinator(
            router: introRouter,
            introViewController: introViewController
        )
    }
}
