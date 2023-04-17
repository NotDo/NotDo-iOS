import Moordinator
import UIKit
import SignUpFeatureInterface

struct SignUpFactoryImpl: SignUpFactory {
    func makeViewController(router: Router) -> UIViewController {
        let signUpRouter = SignUpRouter()
        let signUpStore = SignUpStore(
            router: signUpRouter
        )
        let signUpViewController = SignUpViewController(store: signUpStore)
        return signUpViewController
    }
}
