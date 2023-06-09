import ProjectDescription
import ProjectDescriptionHelpers
import DependencyPlugin

let project = Project.makeModule(
    name: ModulePaths.Feature.IntroFeature.rawValue,
    product: .staticLibrary,
    targets: [.interface, .unitTest],
    internalDependencies: [
        .Feature.BaseFeature,
        .Feature.SignInFeature
    ],
    interfaceDependencies: [
        .SPM.Moordinator
    ]
)
