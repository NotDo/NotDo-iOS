import Moordinator
import UIKit

public protocol SignInFactory {
    func makeMoordinator() -> Moordinator
}
