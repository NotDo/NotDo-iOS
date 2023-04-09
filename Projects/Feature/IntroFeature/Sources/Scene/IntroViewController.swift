import UIKit
import Then
import SnapKit
import BaseFeature
import DesignSystem

final class IntroViewController: BaseViewController<IntroStore> {
    private let testField = NotDoTextView(placeholder: "이메일을 입력해주세요.", secure: false).then { _ in
//        $0.pl = "이메일을 입력해주세요."
    }

//    private let testField = NotDoTextField(placeholder: "이메일을 입력해주세요.").then {
//    }

    override func addView() {
        view.addSubview(testField)
    }

    override func setLayout() {
        testField.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(20)
//            $0.width.equalTo(300)
//            $0.height.equalTo(200)
        }
    }
}
