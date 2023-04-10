import UIKit

public final class NotDoCTAButton: UIButton {
    public override var isEnabled: Bool {
        didSet { setNeedsDisplay() }
    }
    public override var isHighlighted: Bool {
        didSet { setNeedsDisplay() }
    }
    private let text: String

    public init(text: String = "") {
        self.text = text
        super.init(frame: .zero)
        setupButton()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public override func layoutSubviews() {
        super.layoutSubviews()
    }

    public override func draw(_ rect: CGRect) {
        super.draw(rect)
        setButtonColor()
    }
}

private extension NotDoCTAButton {
    func setupButton() {
        self.clipsToBounds = true
        self.titleLabel?.font = .notDo(.titleRegular)
        self.setTitle(text, for: .normal)
        self.layer.cornerRadius = 8
        self.heightAnchor.constraint(
            equalToConstant: 50
        ).isActive = true
    }

    func setButtonColor() {
        let textForegroundColor: UIColor
        let backgroundColor: UIColor
        backgroundColor = isEnabled ? .notDo(.main(.black)) : .notDo(.gray(.gray300))
        textForegroundColor = .notDo(.main(.white))
        setTitleColor(textForegroundColor, for: .normal)
        setTitleColor(textForegroundColor.withAlphaComponent(0.8), for: .highlighted)
        setBackgroundColor(backgroundColor, for: .normal)
        setBackgroundColor(backgroundColor.withAlphaComponent(0.8), for: .highlighted)
    }
}
