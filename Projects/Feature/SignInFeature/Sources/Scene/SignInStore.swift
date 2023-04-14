import BaseFeature
import Combine
import DesignSystem
import Moordinator

final class SignInStore: BaseStore, RouterProvidable {
    let router: any Router
    var bag: Set<AnyCancellable> = .init()

    init(
        router: any Router
    ) {
        self.router = router
    }

    struct State: Equatable {
    }
    enum Action: Equatable {
    }

    let stateSubject = CurrentValueSubject<State, Never>(State())

    func process(_ action: Action) {
    }
}
