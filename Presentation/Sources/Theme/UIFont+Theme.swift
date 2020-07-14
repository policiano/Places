import UIKit

extension UIFont {
    class var heading1: UIFont {
        return ThemeFont.light.font(size: 32.0)
    }

    class var heading2: UIFont {
        return ThemeFont.semiBold.font(size: 16.0)
    }

    class var body1: UIFont {
        return ThemeFont.light.font(size: 16.0)
    }

    class var body2: UIFont {
        return ThemeFont.light.font(size: 14.0)
    }

    class var body3: UIFont {
        return ThemeFont.regular.font(size: 14.0)
    }

    class var caption: UIFont {
        return ThemeFont.regular.font(size: 14.0)
    }
}

typealias ThemeFont = FontFamily.OpenSans
