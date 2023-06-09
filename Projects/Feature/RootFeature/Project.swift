import ProjectDescription
import ProjectDescriptionHelpers
import DependencyPlugin

let project = Project.makeModule(
    name: ModulePaths.Feature.RootFeature.rawValue,
    product: .staticLibrary,
    targets: [.interface],
    internalDependencies: [
        .Feature.BaseFeature,
        .Feature.IntroFeatureInterface
    ],
    interfaceDependencies: [
        .SPM.Moordinator
    ]
)
