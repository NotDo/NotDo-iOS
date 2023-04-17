import BaseFeature
import Combine
import DesignSystem
import Moordinator
import IntroFeatureInterface

final class IntroStore: BaseStore, RouterProvidable {
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
        case signUpButtonDidTap
    }

    let stateSubject = CurrentValueSubject<State, Never>(State())

    func process(_ action: Action) {
        let currentState = stateSubject.value
        let newState = currentState

        switch action {
        case .signUpButtonDidTap:
            router.route.send(IntroRoutePath.signUp)
        }
        stateSubject.send(newState)
    }
}
