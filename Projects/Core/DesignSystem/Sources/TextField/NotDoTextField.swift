import UIKit

public final class NotDoTextField: UITextField {
    public override var placeholder: String? {
        didSet { setNeedsDisplay() }
    }

    private var cleanrButtonWidth: CGFloat {
        clearButtonRect(forBounds: bounds).width
    }

    public var isSecure: Bool = false

    private lazy var secureButton: UIButton = {
        var secureButton = UIButton()
        secureButton.translatesAutoresizingMaskIntoConstraints = false
        secureButton.addTarget(self, action: #selector(secureButtonDidTap(_:)), for: .touchUpInside)
        secureButton.tintColor = .notDo(.gray(.gray300))
        secureButton.frame = CGRect(x: 0, y: 0, width: 24, height: 24)
        secureButton.setImage(UIImage.eye, for: .normal)
        return secureButton
    }()

    @objc func secureButtonDidTap(_ sender: UIButton) {
        secureButton.setImage(isSecureTextEntry ? UIImage.eyeSlash : UIImage.eye, for: .normal)
        isSecureTextEntry.toggle()
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
            self.layer.borderColor = UIColor.notDo(.main(.black)).cgColor
        }
        return didBecomeFirstResponder
    }

    public override func resignFirstResponder() -> Bool {
        let didResignFirstResponder = super.resignFirstResponder()
        if didResignFirstResponder {
            self.layer.borderWidth = 1
            self.layer.borderColor = UIColor.notDo(.gray(.gray400)).cgColor
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
                    + (isSecure ? 24 : 0)
                    + self.cleanrButtonWidth
                    + NotDoTextFieldProperty.Dimension.subviewSpacing
                )
            )
        )
    }

    public override func editingRect(forBounds bounds: CGRect) -> CGRect {
        self.secureButton.isHidden = !isSecure || !isEditing || text?.isEmpty ?? false
        return bounds.inset(
            by: UIEdgeInsets(
                top: 0,
                left: NotDoTextFieldProperty.Dimension.leftMargin,
                bottom: 0,
                right: (
                    NotDoTextFieldProperty.Dimension.rightMargin
                    + (isSecure ? 24 : 0)
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
        self.clearButtonMode = .whileEditing
        self.clipsToBounds = true
        self.layer.cornerRadius = 10

        self.heightAnchor.constraint(
            equalToConstant: NotDoTextFieldProperty.Dimension.textFieldInsideHeight
        ).isActive = true
        self.addSubview(secureButton)
        self.secureButton.trailingAnchor.constraint(
            equalTo: self.trailingAnchor, constant: -48
        ).isActive = true
        self.secureButton.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        self.isEnabled = true
        self.textColor = .notDo(.main(.black))
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.notDo(.gray(.gray400)).cgColor
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

public final class NotDoTextView: UIView {
    private lazy var textLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.alpha = 0.5
        return label
    }()

    private let textField: NotDoTextField = {
        let textLabel = NotDoTextField()
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        return textLabel
    }()

    public init(placeholder: String? = "", text: String? = "", secure: Bool? = false) {
        super.init(frame: .zero)
        self.textField.placeholder = placeholder
        self.textLabel.text = text
        self.textField.isSecure = secure ?? false
        configureViews()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configureViews() {
        addSubview(textField)
        addSubview(textLabel)

        NSLayoutConstraint.activate([
            self.heightAnchor.constraint(equalToConstant: NotDoTextFieldProperty.Dimension.textFieldInsideHeight),
            textLabel.topAnchor.constraint(equalTo: textField.topAnchor, constant: -24),
            textLabel.leadingAnchor.constraint(equalTo: textField.leadingAnchor, constant: 5),
            textField.heightAnchor.constraint(
                equalToConstant: NotDoTextFieldProperty.Dimension.textFieldInsideHeight
            ),
            textField.widthAnchor.constraint(equalTo: widthAnchor)
        ])
    }
}
