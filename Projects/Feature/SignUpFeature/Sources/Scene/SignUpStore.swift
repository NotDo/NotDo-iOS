import BaseFeature
import Combine
import DesignSystem
import Moordinator

final class SignUpStore: BaseStore {
    let route: PassthroughSubject<RoutePath, Never> = .init()
    var bag: Set<AnyCancellable> = .init()

    struct State: Equatable {
        var isCheck: Bool = false
    }
    enum Action: Equatable {
        case checkButtonDidTap
        case seeMoreButtonDidTap
    }

    let stateSubject = CurrentValueSubject<State, Never>(State())

    func process(_ action: Action) {
        let currentState = stateSubject.value
        var newState = currentState

        switch action {
        case .checkButtonDidTap:
            newState.isCheck.toggle()
        case .seeMoreButtonDidTap:
            route.send(NotDoRoutePath.renewalPassword)
        }

        stateSubject.send(newState)
    }
}
