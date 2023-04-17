import UIKit
import DesignSystem
import BaseFeature
import SignUpFeatureInterface

final class SignUpViewController: BaseViewController<SignUpStore> {
    private let notDoImage = NotDoIconView(size: .custom(CGSize(width: 64, height: 18))).then {
        $0.image = .notDoImage
    }

    private let titleLabel = UILabel().then {
        $0.numberOfLines = 2
        $0.font = .notDo(.headline1SemiBold)
        $0.text = "낫두가\n처음이시군요?"
    }

    private let termsLabel = UILabel().then {
        $0.text = "약관동의"
        $0.font = .notDo(.caption2Medium)
    }

    private let checkBox = NotDoCheckBox()

    private let privacyLabel = UILabel().then {
        $0.text = "개인정보 3자 제공 동의"
        $0.font = .notDo(.titleRegular)
    }

    private let seeMoreButton = UIButton().then {
        $0.titleLabel?.font = .notDo(.caption1Regular)
        $0.setTitleColor(.notDo(.gray(.gray500)), for: .normal)
        $0.setTitle("자세히보기", for: .normal)
    }

    private let nextButton = NotDoCTAButton(text: "다음").then {
        $0.isEnabled = true
    }

    override func addView() {
        view.addSubviews(
            notDoImage,
            titleLabel,
            termsLabel,
            checkBox,
            privacyLabel,
            seeMoreButton,
            nextButton
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

        termsLabel.snp.makeConstraints {
            $0.leading.equalTo(titleLabel.snp.leading)
            $0.top.equalTo(titleLabel.snp.bottom).offset(56)
        }

        checkBox.snp.makeConstraints {
            $0.leading.equalTo(termsLabel.snp.leading)
            $0.top.equalTo(termsLabel.snp.bottom).offset(10)
        }

        privacyLabel.snp.makeConstraints {
            $0.leading.equalTo(checkBox.snp.trailing).offset(10)
            $0.top.equalTo(checkBox.snp.top)
        }

        seeMoreButton.snp.makeConstraints {
            $0.leading.equalTo(privacyLabel.snp.leading)
            $0.top.equalTo(privacyLabel.snp.bottom).offset(6)
        }

        nextButton.snp.makeConstraints {
            $0.bottom.equalTo(view.snp.bottom).inset(48)
            $0.leading.trailing.equalToSuperview().inset(16)
        }
    }
}
