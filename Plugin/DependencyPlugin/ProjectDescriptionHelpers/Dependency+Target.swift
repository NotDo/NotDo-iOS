import ProjectDescription

// swiftlint: disable all
public extension TargetDependency {
    struct Feature {}
    struct Domain {}
    struct Core {}
    struct Shared {}
}

public extension TargetDependency.Feature {
    static let SignUpFeatureTesting = TargetDependency.project(
        target: ModulePaths.Feature.SignUpFeature.targetName(type: .testing),
        path: .relativeToFeature(ModulePaths.Feature.SignUpFeature.rawValue)
    )
    static let SignUpFeatureInterface = TargetDependency.project(
        target: ModulePaths.Feature.SignUpFeature.targetName(type: .interface),
        path: .relativeToFeature(ModulePaths.Feature.SignUpFeature.rawValue)
    )
    static let SignUpFeature = TargetDependency.project(
        target: ModulePaths.Feature.SignUpFeature.targetName(type: .sources),
        path: .relativeToFeature(ModulePaths.Feature.SignUpFeature.rawValue)
    )
    static let SignInFeatureInterface = TargetDependency.project(
        target: ModulePaths.Feature.SignInFeature.targetName(type: .interface),
        path: .relativeToFeature(ModulePaths.Feature.SignInFeature.rawValue)
    )
    static let SignInFeature = TargetDependency.project(
        target: ModulePaths.Feature.SignInFeature.targetName(type: .sources),
        path: .relativeToFeature(ModulePaths.Feature.SignInFeature.rawValue)
    )
    static let IntroFeatureInterface = TargetDependency.project(
        target: ModulePaths.Feature.IntroFeature.targetName(type: .interface),
        path: .relativeToFeature(ModulePaths.Feature.IntroFeature.rawValue)
    )
    static let IntroFeature = TargetDependency.project(
        target: ModulePaths.Feature.IntroFeature.targetName(type: .sources),
        path: .relativeToFeature(ModulePaths.Feature.IntroFeature.rawValue)
    )
    static let RootFeatureInterface = TargetDependency.project(
        target: ModulePaths.Feature.RootFeature.targetName(type: .interface),
        path: .relativeToFeature(ModulePaths.Feature.RootFeature.rawValue)
    )
    static let RootFeature = TargetDependency.project(
        target: ModulePaths.Feature.RootFeature.targetName(type: .sources),
        path: .relativeToFeature(ModulePaths.Feature.RootFeature.rawValue)
    )
    static let BaseFeature = TargetDependency.project(
        target: ModulePaths.Feature.BaseFeature.targetName(type: .sources),
        path: .relativeToFeature(ModulePaths.Feature.BaseFeature.rawValue)
    )
}

public extension TargetDependency.Domain {
    static let BaseDomain = TargetDependency.project(
        target: ModulePaths.Domain.BaseDomain.targetName(type: .sources),
        path: .relativeToDomain(ModulePaths.Domain.BaseDomain.rawValue)
    )
}

public extension TargetDependency.Core {
    static let DesignSystem = TargetDependency.project(
        target: ModulePaths.Core.DesignSystem.targetName(type: .sources),
        path: .relativeToCore(ModulePaths.Core.DesignSystem.rawValue)
    )
}

public extension TargetDependency.Shared {
    static let CombineUtility = TargetDependency.project(
        target: ModulePaths.Shared.CombineUtility.targetName(type: .sources),
        path: .relativeToShared(ModulePaths.Shared.CombineUtility.rawValue)
    )
    static let UtilityModule = TargetDependency.project(
        target: ModulePaths.Shared.UtilityModule.targetName(type: .sources),
        path: .relativeToShared(ModulePaths.Shared.UtilityModule.rawValue)
    )
    static let GlobalThirdPartyLibrary = TargetDependency.project(
        target: ModulePaths.Shared.GlobalThirdPartyLibrary.targetName(type: .sources),
        path: .relativeToShared(ModulePaths.Shared.GlobalThirdPartyLibrary.rawValue)
    )
}
