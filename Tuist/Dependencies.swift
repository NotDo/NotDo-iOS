import ProjectDescription
import ConfigurationPlugin

let dependencies = Dependencies(
    carthage: nil,
    swiftPackageManager: SwiftPackageManagerDependencies(
        [
            .remote(url: "https://github.com/hackiftekhar/IQKeyboardManager.git", requirement: .exact("6.5.0")),
            .remote(url: "https://github.com/Swinject/Swinject.git", requirement: .exact("2.8.3")),
            .remote(url: "https://github.com/SnapKit/SnapKit", requirement: .exact("5.6.0")),
            .remote(url: "https://github.com/devxoul/Then", requirement: .exact("3.0.0")),
            .remote(url: "https://github.com/GSM-MSG/Moordinator.git", requirement: .exact("2.0.0"))
        ],
        productTypes: [
            "Moordinator": .framework,
            "SnapKit": .framework,
            "Then": .framework
        ],
        baseSettings: .settings(
            configurations: [
                .debug(name: .dev),
                .debug(name: .stage),
                .release(name: .prod)
            ]
        )
    ),
    platforms: [.iOS]
)
