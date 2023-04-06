import UIKit

public final class NotDoTextField: UITextField {
    public override var placeholder: String? {
        didSet { setNeedsDisplay() }
    }
    private var cleanrButtonWidth: CGFloat {
        clearButtonRect(forBounds: bounds).width
    }

    public init(placeholder: String? = "") {
        super.init(frame: .zero)
        self.placeholder = placeholder
        setupTextField()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public override func becomeFirstResponder() -> Bool {
        let didBecomeFirstResponder = super.becomeFirstResponder()
        if didBecomeFirstResponder {
            self.layer.borderWidth = 1
            self.layer.borderColor = UIColor.notDo(.gray(.gray400)).cgColor
        }
        return didBecomeFirstResponder
    }

    public override func resignFirstResponder() -> Bool {
        let didResignFirstResponder = super.resignFirstResponder()
        if didResignFirstResponder {
            self.layer.borderWidth = 1
            self.layer.borderColor = UIColor.notDo(.main(.black)).cgColor
        }
        return didResignFirstResponder
    }

    public override func draw(_ rect: CGRect) {
        super.draw(rect)
        setPlaceholderTextColor()
    }

    ///  clearButton의 Bound에 관한 함수
    ///  clearButton 우측 마진을 주기 위해 사용
    public override func clearButtonRect(forBounds bounds: CGRect) -> CGRect {
        let rect = super.clearButtonRect(forBounds: bounds)
        return rect.offsetBy(
            dx: -(
                NotDoTextFieldProperty.Dimension.rightMargin
                - NotDoTextFieldProperty.Dimension.clearButtonDefaultRightMargin
            ),
            dy: 0
        )
    }

    public override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(
            by: UIEdgeInsets(
                top: 0,
                left: NotDoTextFieldProperty.Dimension.leftMargin,
                bottom: 0,
                right: (
                    NotDoTextFieldProperty.Dimension.rightMargin
                    + self.cleanrButtonWidth
                    + NotDoTextFieldProperty.Dimension.subviewSpacing
                )
            )
        )
    }

    public override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(
            by: UIEdgeInsets(
                top: 0,
                left: NotDoTextFieldProperty.Dimension.leftMargin,
                bottom: 0,
                right: (
                    NotDoTextFieldProperty.Dimension.rightMargin
                    + self.cleanrButtonWidth
                    + NotDoTextFieldProperty.Dimension.subviewSpacing
                )
            )
        )
    }
}

private extension NotDoTextField {
    func setupTextField() {
        self.backgroundColor = .notDo(.main(.white))
        self.font = .notDo(.bodyRegular)
        self.tintColor = .notDo(.main(.black))
        self.clearButtonMode = .whileEditing
        self.clipsToBounds = true
        self.layer.cornerRadius = 8

        self.heightAnchor.constraint(
            equalToConstant: NotDoTextFieldProperty.Dimension.textFieldHeight
        ).isActive = true
        self.isEnabled = true
        self.textColor = .notDo(.main(.black))
        self.layer.borderWidth = 1
        self.layer.borderColor = nil
    }

    func setPlaceholderTextColor() {
        let placeholderTextColor = UIColor.notDo(.gray(.gray500))

        guard let placeholder else { return }
        self.attributedPlaceholder = NSAttributedString(
            string: placeholder,
            attributes: [
                .foregroundColor: placeholderTextColor
            ]
        )
    }
}
