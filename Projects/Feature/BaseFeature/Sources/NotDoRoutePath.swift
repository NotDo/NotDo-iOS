import Moordinator

public enum NotDoRoutePath: RoutePath {
    case splash
    case signin
    case signup
    case renewalPassword
    case main
}

public extension RoutePath {
    var asNotDo: NotDoRoutePath? {
        self as? NotDoRoutePath
    }
}
