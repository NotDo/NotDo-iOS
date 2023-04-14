import UIKit
import DesignSystem
import BaseFeature

final class SignInViewController: BaseViewController<SignInStore> {
    private let notDoImage = NotDoIconView(size: .custom(CGSize(width: 64, height: 18))).then {
        $0.image = .notDoImage
    }

    private let titleLabel = UILabel().then {
        $0.numberOfLines = 2
        $0.font = .notDo(.headline1SemiBold)
        $0.text = "낫두에 다시\n오신걸 환영해요!"
    }

    private let emailTextField = NotDoTextView(
        placeholder: "가입하신 이메일을 입력해주세요.",
        text: "이메일",
        errorText: "텍스트를 입력해주세요"
    )

    private let passwordTextField = NotDoTextView(
        placeholder: "가입하신 비밀번호를 입력해주세요.",
        text: "비밀번호",
        isSecure: true,
        errorText: "텍스트를 입력해주세요"
    )

    private let findPasswordButton = UIButton().then {
        $0.setImage(UIImage.chevronRight, for: .normal)
        $0.setTitle("비밀번호를 잊으셨나요?", for: .normal)
        $0.imageEdgeInsets = .init(top: 0, left: 8, bottom: 0, right: 0)
        $0.imageView?.tintColor = .black
        $0.imageView?.contentMode = .scaleAspectFit
        $0.setTitleColor(.notDo(.main(.black)), for: .normal)
        $0.titleLabel?.font = .notDo(.caption1Regular)
        $0.semanticContentAttribute = .forceRightToLeft
        $0.contentHorizontalAlignment = .center
    }

    private let signInButton = NotDoCTAButton(text: "로그인").then {
        $0.isEnabled = true
    }

    override func addView() {
        view.addSubviews(
            notDoImage,
            titleLabel,
            emailTextField,
            passwordTextField,
            findPasswordButton,
            signInButton
        )
    }

    override func setLayout() {
        notDoImage.snp.makeConstraints {
            $0.top.equalTo(120)
            $0.leading.equalTo(16)
        }

        titleLabel.snp.makeConstraints {
            $0.top.equalTo(notDoImage.snp.bottom).offset(20)
            $0.leading.equalTo(notDoImage.snp.leading)
        }

        emailTextField.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(24)
            $0.leading.trailing.equalToSuperview().inset(16)
        }

        passwordTextField.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.top.equalTo(emailTextField.snp.bottom).offset(24)
        }

        findPasswordButton.snp.makeConstraints {
            $0.leading.equalTo(passwordTextField.snp.leading)
            $0.top.equalTo(passwordTextField.snp.bottom).offset(16)
        }

        signInButton.snp.makeConstraints {
            $0.bottom.equalTo(view.snp.bottom).inset(48)
            $0.leading.trailing.equalToSuperview().inset(16)
        }
    }
}
