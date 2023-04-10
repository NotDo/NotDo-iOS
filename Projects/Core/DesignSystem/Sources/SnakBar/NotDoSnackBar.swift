import UIKit

public final class NotDoSnackBar: UIView {
    public enum Duration: Double {
        case short = 1.5
        case long = 3
    }

    private enum Dimension {
        // swiftlint: disable nesting
        enum Margin {
            static let horizontal: CGFloat = 16
            static let vertical: CGFloat = 66
        }

        enum Padding {
            static let horizontal: CGFloat = 8
            static let vertical: CGFloat = 28
        }

        static let viewSpacing: CGFloat = 4
    }

    private let label: UILabel = {
        let label = UILabel()
        label.textColor = .notDo(.main(.black))
        label.numberOfLines = 0
        return label
    }()
    private let iconView: NotDoIconView = NotDoIconView()
    private var text: String? {
        get { label.text }
        set { label.text = newValue }
    }
    private let duration: Duration

    private init(
        text: String?,
        duration: NotDoSnackBar.Duration,
        icon: UIImage?
    ) {
        self.duration = duration
        super.init(frame: .zero)
        self.text = text
        self.label.font = .notDo(.subTitleRegular)
        self.iconView.image = icon
        self.iconView.tintColor = .notDo(.main(.black))
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public static func makeSnack(
        text: String?,
        duration: NotDoSnackBar.Duration = .short,
        icon: UIImage
    ) {
        guard let text, !text.isEmpty else { return }
        let snack = NotDoSnackBar(
            text: text,
            duration: duration,
            icon: icon
        )

        guard let window = UIApplication.currentWindow() else { return }
        window.addSubview(snack)
        snack.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            snack.bottomAnchor.constraint(
                equalTo: window.safeAreaLayoutGuide.bottomAnchor,
                constant: -16
            ),
            snack.leadingAnchor.constraint(
                equalTo: window.leadingAnchor,
                constant: Dimension.Margin.horizontal
            ),
            snack.trailingAnchor.constraint(
                equalTo: window.trailingAnchor,
                constant: -Dimension.Margin.horizontal
            )
        ])
        snack.showSnack()
    }

    private func showSnack() {
        UIView.animate(
            withDuration: 0.5,
            delay: 0.0,
            options: .curveEaseIn,
            animations: {
                let topTansform = CGAffineTransform(translationX: 0.0, y: -16.0)
                self.transform = topTansform
                self.alpha = 1.0
            }, completion: { _ in
                self.hideSnackAfterDuration()
            }
        )
    }

    private func hideSnackAfterDuration() {
        UIView.animate(
            withDuration: 0.5,
            delay: self.duration.rawValue,
            options: .curveEaseOut,
            animations: {
                let bottomTansform = CGAffineTransform(translationX: 0.0, y: 0.0)
                self.transform = bottomTansform
                self.alpha = 0.0
            }, completion: { _ in
                self.removeFromSuperview()
            }
        )
    }
}

private extension NotDoSnackBar {
    func setupView() {
        self.addSubview(label)
        self.addSubview(iconView)
        setLayout()
        self.backgroundColor = .notDo(.gray(.gray500))
        self.layer.cornerRadius = 8
        self.alpha = 0
    }

    func setLayout() {
        label.translatesAutoresizingMaskIntoConstraints = false
        iconView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            iconView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            iconView.leadingAnchor.constraint(
                equalTo: self.leadingAnchor,
                constant: Dimension.Padding.horizontal
            ),

            label.leadingAnchor.constraint(
                equalTo: iconView.trailingAnchor,
                constant: Dimension.viewSpacing
            ),
            label.trailingAnchor.constraint(
                equalTo: self.trailingAnchor,
                constant: -Dimension.Padding.vertical
            ),
            label.heightAnchor.constraint(
                equalTo: self.heightAnchor,
                constant: -Dimension.Padding.vertical
            ),
            label.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
}
