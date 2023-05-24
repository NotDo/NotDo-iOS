import Moordinator
import UIKit

struct SignUpFactoryImpl: SignUpFactory {
    func makeViewController() -> UIViewController {
        let signUpStore = SignUpStore()
        let signUpViewController = SignUpViewController(store: signUpStore)
        return signUpViewController
    }
}
