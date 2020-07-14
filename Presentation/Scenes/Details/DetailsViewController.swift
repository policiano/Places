import UIKit

public final class DetailsViewController: UIViewController {
    private lazy var label: UILabel = {
        let label = UILabel()
        label.text = L10n.test
        return label
    }()

    public override func viewDidLoad() {
        title = "Details"
        view.backgroundColor = .white
        view.addSubview(label)
    }
}
