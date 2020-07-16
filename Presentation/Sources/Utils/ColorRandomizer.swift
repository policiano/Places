import UIKit

final class ColorRandomizer {
    private let colors: [UIColor]

    init(colors: [UIColor] = [.lightPink, .creme, .duckEggBlue]) {
        self.colors = colors
    }

    var randomColor: UIColor {
        colors.shuffled().first ?? .clear
    }
}
