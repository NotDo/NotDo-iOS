import Moordinator
import UIKit

public protocol SignUpFactory {
    func makeMoordinator() -> Moordinator
}
