import ProjectDescription

public extension TargetDependency {
    struct SPM {}
}

public extension TargetDependency.SPM {
    static let Moordinator = TargetDependency.external(name: "Moordinator")
    static let Moya = TargetDependency.external(name: "Moya")
    static let IQKeyboardManagerSwift = TargetDependency.external(name: "IQKeyboardManagerSwift")
    static let SnapKit = TargetDependency.external(name: "SnapKit")
    static let Then = TargetDependency.external(name: "Then")
    static let Swinject = TargetDependency.external(name: "Swinject")
}

public extension Package {
}
