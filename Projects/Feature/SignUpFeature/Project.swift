import ProjectDescription
import ProjectDescriptionHelpers
import DependencyPlugin

let project = Project.makeModule(
    name: ModulePaths.Feature.SignUpFeature.rawValue,
    product: .staticLibrary,
    targets: [.interface, .testing, .unitTest],
    internalDependencies: [
        .Feature.BaseFeature
    ],
    interfaceDependencies: [
        .SPM.Moordinator
    ]
)
