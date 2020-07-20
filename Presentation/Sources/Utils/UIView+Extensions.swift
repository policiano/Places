import UIKit

extension UIView {
    func setHidden(_ isHidden: Bool, animated: Bool = true, duration: TimeInterval = 0.5) {
        UIView.animate(
            withDuration: duration,
            animations: { self.alpha = isHidden ? 0 : 1 },
            completion: { _ in self.isHidden = isHidden }
        )
    }
}
