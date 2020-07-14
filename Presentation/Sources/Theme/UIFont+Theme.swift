import UIKit

extension UIFont {
    class var heading1: UIFont {
        return font(.light, size: 32.0)
    }

    class var heading2: UIFont {
        return font(.semibold, size: 16.0)
    }

    class var body1: UIFont {
        return font(.light, size: 16.0)
    }

    class var body2: UIFont {
        return font(.light, size: 14.0)
    }

    class var body3: UIFont {
        return font(.regular, size: 14.0)
    }

    class var caption: UIFont {
        return font(.regular, size: 14.0)
    }

    private static func font(_ fontWeight: FontWeight, size: CGFloat) -> UIFont {
        return UIFont(name: fontWeight.fontName, size: size) ?? .systemFont(ofSize: size, weight: fontWeight.weight)
    }
}

enum FontWeight {
    case regular
    case light
    case semibold

    var fontFamily: String {
        "OpenSans"
    }

    var fontName: String {
        let weight: String

        switch self {
        case .regular:
            return fontFamily
        case .light:
            weight = "Light"
        case .semibold:
            weight = "Semibold"
        }

        return "\(fontFamily)-\(weight)"
    }

    var weight: UIFont.Weight {
        switch self {
        case .regular:
            return UIFont.Weight.regular
        case .light:
            return UIFont.Weight.light
        case .semibold:
            return UIFont.Weight.semibold
        }
    }
}
