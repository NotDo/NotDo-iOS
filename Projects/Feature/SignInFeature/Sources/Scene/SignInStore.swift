import BaseFeature
import Combine
import DesignSystem
import Moordinator

final class SignInStore: BaseStore {
    var route: PassthroughSubject<RoutePath, Never> = .init()

    var bag: Set<AnyCancellable> = .init()

    struct State: Equatable {
    }
    enum Action: Equatable {
    }

    let stateSubject = CurrentValueSubject<State, Never>(State())

    func process(_ action: Action) {
    }
}
