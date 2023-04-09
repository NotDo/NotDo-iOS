import UIKit

public extension UIFont {
    enum NotDoFontSystem: NotDoFontable {
        case headline1Bold
        case headline1SemiBold
        case headline1Medium
        case headline1Regular
        case headline2Bold
        case headline2SemiBold
        case headline2Medium
        case headline2Regular
        case titleBold
        case titleSemiBold
        case titleMedium
        case titleRegular
        case subTitleBold
        case subTitleSemiBold
        case subTitleMedium
        case subTitleRegular
        case bodyBold
        case bodySemiBold
        case bodyMedium
        case bodyRegular
        case caption1Bold
        case caption1SemiBold
        case caption1Medium
        case caption1Regular
        case caption2Bold
        case caption2SemiBold
        case caption2Medium
        case caption2Regular
        case caption3Bold
        case caption3SemiBold
        case caption3Medium
        case caption3Regular
    }

    static func notDo(_ style: NotDoFontSystem) -> UIFont {
        return style.font
    }
}

public extension UIFont.NotDoFontSystem {
    var font: UIFont {
        switch self {
        case .headline1Bold:
            return UIFont(font: DesignSystemFontFamily.Pretendard.bold, size: 24) ?? .init()
        case .headline1SemiBold:
            return UIFont(font: DesignSystemFontFamily.Pretendard.semiBold, size: 24) ?? .init()
        case .headline1Medium:
            return UIFont(font: DesignSystemFontFamily.Pretendard.medium, size: 24) ?? .init()
        case .headline1Regular:
            return UIFont(font: DesignSystemFontFamily.Pretendard.regular, size: 24) ?? .init()
        case .headline2Bold:
            return UIFont(font: DesignSystemFontFamily.Pretendard.bold, size: 20) ?? .init()
        case .headline2SemiBold:
            return UIFont(font: DesignSystemFontFamily.Pretendard.semiBold, size: 20) ?? .init()
        case .headline2Medium:
            return UIFont(font: DesignSystemFontFamily.Pretendard.medium, size: 20) ?? .init()
        case .headline2Regular:
            return UIFont(font: DesignSystemFontFamily.Pretendard.regular, size: 20) ?? .init()
        case .titleBold:
            return UIFont(font: DesignSystemFontFamily.Pretendard.bold, size: 16) ?? .init()
        case .titleSemiBold:
            return UIFont(font: DesignSystemFontFamily.Pretendard.semiBold, size: 16) ?? .init()
        case .titleMedium:
            return UIFont(font: DesignSystemFontFamily.Pretendard.medium, size: 16) ?? .init()
        case .titleRegular:
            return UIFont(font: DesignSystemFontFamily.Pretendard.regular, size: 16) ?? .init()
        case .subTitleBold:
            return UIFont(font: DesignSystemFontFamily.Pretendard.bold, size: 15) ?? .init()
        case .subTitleSemiBold:
            return UIFont(font: DesignSystemFontFamily.Pretendard.semiBold, size: 15) ?? .init()
        case .subTitleMedium:
            return UIFont(font: DesignSystemFontFamily.Pretendard.medium, size: 15) ?? .init()
        case .subTitleRegular:
            return UIFont(font: DesignSystemFontFamily.Pretendard.regular, size: 15) ?? .init()
        case .bodyBold:
            return UIFont(font: DesignSystemFontFamily.Pretendard.bold, size: 14) ?? .init()
        case .bodySemiBold:
            return UIFont(font: DesignSystemFontFamily.Pretendard.semiBold, size: 14) ?? .init()
        case .bodyMedium:
            return UIFont(font: DesignSystemFontFamily.Pretendard.medium, size: 14) ?? .init()
        case .bodyRegular:
            return UIFont(font: DesignSystemFontFamily.Pretendard.regular, size: 14) ?? .init()
        case .caption1Bold:
            return UIFont(font: DesignSystemFontFamily.Pretendard.bold, size: 13) ?? .init()
        case .caption1SemiBold:
            return UIFont(font: DesignSystemFontFamily.Pretendard.semiBold, size: 13) ?? .init()
        case .caption1Medium:
            return UIFont(font: DesignSystemFontFamily.Pretendard.medium, size: 13) ?? .init()
        case .caption1Regular:
            return UIFont(font: DesignSystemFontFamily.Pretendard.regular, size: 13) ?? .init()
        case .caption2Bold:
            return UIFont(font: DesignSystemFontFamily.Pretendard.bold, size: 12) ?? .init()
        case .caption2SemiBold:
            return UIFont(font: DesignSystemFontFamily.Pretendard.semiBold, size: 12) ?? .init()
        case .caption2Medium:
            return UIFont(font: DesignSystemFontFamily.Pretendard.medium, size: 12) ?? .init()
        case .caption2Regular:
            return UIFont(font: DesignSystemFontFamily.Pretendard.regular, size: 12) ?? .init()
        case .caption3Bold:
            return UIFont(font: DesignSystemFontFamily.Pretendard.bold, size: 11) ?? .init()
        case .caption3SemiBold:
            return UIFont(font: DesignSystemFontFamily.Pretendard.semiBold, size: 11) ?? .init()
        case .caption3Medium:
            return UIFont(font: DesignSystemFontFamily.Pretendard.medium, size: 11) ?? .init()
        case .caption3Regular:
            return UIFont(font: DesignSystemFontFamily.Pretendard.regular, size: 11) ?? .init()
        }
    }
}
