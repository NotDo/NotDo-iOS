import BaseFeature
import Combine
import DesignSystem
import Moordinator
import SignUpFeatureInterface

final class SignUpStore: BaseStore, RouterProvidable {
    let router: any Router
    var bag: Set<AnyCancellable> = .init()

    init(
        router: any Router
    ) {
        self.router = router
    }

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
            router.route.send(SignUpRoutePath.findPassword)
        }

        stateSubject.send(newState)
    }
}
