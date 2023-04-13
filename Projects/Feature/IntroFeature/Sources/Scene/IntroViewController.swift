import UIKit
import Then
import SnapKit
import BaseFeature
import DesignSystem

final class IntroViewController: BaseViewController<IntroStore> {
    private let notDoImage = UIImageView().then {
        $0.image = .notDoImage
    }
    private let titleLabel = UILabel().then {
        $0.numberOfLines = 2
        $0.textAlignment = .center
        $0.text = "낫두와 함께 목표를\n매일 세우고 함께 성장해봐요!"
        $0.font = .notDo(.headline2SemiBold)
    }

    private let signInButton = NotDoCTAButton(text: "로그인").then {
        $0.isEnabled = true
    }

    private let signUpButton = UIButton().then {
        $0.titleLabel?.alpha = 0.6
        let attributedString = NSMutableAttributedString()
            .regular(string: "혹시 낫두가 처음이신가요? ")
            .semiBold(string: "회원가입")
        $0.setAttributedTitle(attributedString, for: .normal)
    }

    override func addView() {
        view.addSubviews(notDoImage, titleLabel, signInButton, signUpButton)
    }

    override func setLayout() {
        notDoImage.snp.makeConstraints {
            $0.top.equalTo(264)
            $0.centerX.equalToSuperview()
        }
        titleLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(notDoImage.snp.bottom).offset(32)
        }
        signInButton.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.bottom.equalTo(view.snp.bottom).offset(-98)
        }
        signUpButton.snp.makeConstraints {
            $0.top.equalTo(signInButton.snp.bottom).offset(32)
            $0.centerX.equalToSuperview()
        }
    }
}
