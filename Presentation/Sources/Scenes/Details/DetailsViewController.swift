import Anchorage
import UIKit

public final class DetailsViewController: UIViewController {
    private lazy var label: UILabel = {
        let label = UILabel()
        label.font = .heading1
        return label
    }()

    public override func viewDidLoad() {
        title = "Details"
        view.backgroundColor = .white
        view.addSubview(label)

        label.edgeAnchors == view.edgeAnchors
    }
}
