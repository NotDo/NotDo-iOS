import BaseFeature
import Combine
import DesignSystem
import Moordinator

final class IntroStore: BaseStore {
    let route: PassthroughSubject<RoutePath, Never> = .init()
    var bag: Set<AnyCancellable> = .init()

    struct State: Equatable {
    }
    enum Action: Equatable {
        case signUpButtonDidTap
    }

    let stateSubject = CurrentValueSubject<State, Never>(State())

    func process(_ action: Action) {
        let currentState = stateSubject.value
        let newState = currentState

        switch action {
        case .signUpButtonDidTap:
            route.send(NotDoRoutePath.signup)
        }
        stateSubject.send(newState)
    }
}
