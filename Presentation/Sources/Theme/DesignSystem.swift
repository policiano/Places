import UIKit

enum DesignSystem {

}

extension DesignSystem {
    struct Color {
        static var primaryTextColor: UIColor {
            .darkGraphite
        }

        static var secondaryTextColor: UIColor {
            isOnDarkMode ? .systemGray : .brownishGrey
        }

        static var captionTextColor: UIColor {
            isOnDarkMode ? .white : .blackTwo
        }

        static var acentTextColor: UIColor {
            .topaz
        }

        static var acentBaseColor: UIColor {
            isOnDarkMode ? .systemGray6 : .topaz
        }

        static var borderColor: UIColor {
            isOnDarkMode ? .systemGray4 : .clear
        }

        private static var isOnDarkMode: Bool {
            UITraitCollection.current.userInterfaceStyle == .dark
        }
    }
}
