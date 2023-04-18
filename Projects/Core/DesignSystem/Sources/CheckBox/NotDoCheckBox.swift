import UIKit

public final class NotDoCheckBox: UIView {
    private lazy var checkBox: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: 0, y: 0, width: 18, height: 18)
        button.layer.cornerRadius = 7
        button.backgroundColor = .notDo(.gray(.gray200))
        return button
    }()

    private var isCheck = false

    private var darkMode = false

    public init(isCheck: Bool? = false, darkMode: Bool? = false) {
        super.init(frame: .zero)
        self.isCheck = isCheck ?? false
        self.darkMode = darkMode ?? false
        setupCheckBox()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension NotDoCheckBox {
    func setupCheckBox() {
        addSubview(checkBox)
        self.checkBox.backgroundColor = darkMode ? .notDo(.gray(.gray200)) : .notDo(.gray(.gray600))
        self.checkBox.setImage(isCheck ? UIImage.checkBox : UIImage.init(), for: .normal)
    }
}
