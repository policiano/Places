import Anchorage
import UIKit

protocol HomeDisplayLogic: AnyObject {
    func displayPlaces(viewModel: Home.GetPlaces.ViewModel)
}

final class HomeCollectionViewController: UICollectionViewController {

    private let activityIndicatorView = UIActivityIndicatorView(style: .large)
    private lazy var stackView: UIStackView = {
        StackViewBuilder {
            $0.alignment = .center
            $0.distribution = .fill
            $0.arrangedSubviews = [activityIndicatorView, errorMessageLabel]
        }.build()
    }()
    private let errorMessageLabel: UILabel = {
        let label = UILabel()
        label.font = .body1
        label.textAlignment = .center
        label.textColor = DesignSystem.Color.secondaryTextColor
        label.numberOfLines = 0
        return label
    }()

    private let presenter: HomePresentationLogic

    init(presenter: HomePresentationLogic) {
        self.presenter = presenter
        super.init(collectionViewLayout: PinterestLayout())
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) { nil }

    override func viewDidLoad() {
        setup()
    }

    override func viewWillAppear(_ animated: Bool) {
        startLoading()
        presenter.presentPlaces(request: .init())
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    private var items: [Home.GetPlaces.ViewModel.Item] = [] {
        didSet {
            collectionView.reloadData()
        }
    }

    private func setup() {
        setupSubviews()

        (collectionView?.collectionViewLayout as? PinterestLayout)?.delegate = self

        title = L10n.Home.NavBar.title.uppercased()
        collectionView.backgroundColor = .systemBackground
        view.backgroundColor = .systemBackground
        collectionView?.contentInset = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
        collectionView.register(PlaceCell.self, forCellWithReuseIdentifier: PlaceCell.identifier)
    }

    private func setupSubviews() {
        view.addSubview(stackView)
        stackView.centerAnchors == view.centerAnchors
        stackView.horizontalAnchors >= view.horizontalAnchors + 24

        errorMessageLabel.isHidden = true
        activityIndicatorView.isHidden = false
        activityIndicatorView.hidesWhenStopped = true
        activityIndicatorView.startAnimating()
    }

    private func showError(message: String) {
        errorMessageLabel.text = message
        errorMessageLabel.setHidden(false)
        activityIndicatorView.setHidden(true)
        stackView.setHidden(false)
        collectionView.setHidden(true)
    }

    private func startLoading() {
        errorMessageLabel.setHidden(true)
        activityIndicatorView.setHidden(false)
        stackView.setHidden(false)
        collectionView.setHidden(true)
    }

    private func showContent() {
        stackView.setHidden(true)
        collectionView.setHidden(false)
    }
}

extension HomeCollectionViewController: UICollectionViewDelegateFlowLayout {

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        items.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = PlaceCell.dequeued(fromCollectionView: collectionView, for: indexPath) else {
            return UICollectionViewCell()
        }
        cell.update(with: items[indexPath.item])
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemSize = (collectionView.frame.width - (collectionView.contentInset.left + collectionView.contentInset.right + 10)) / 2
        return CGSize(width: itemSize, height: itemSize)
    }
}

extension HomeCollectionViewController: HomeDisplayLogic {
    func displayPlaces(viewModel: Home.GetPlaces.ViewModel) {
        switch viewModel {
        case .content(let items):
            self.items = items
            showContent()
        case .empty(let message):
            showError(message: message)
        }
    }
}

extension HomeCollectionViewController: PinterestLayoutDelegate {
    func collectionView(
        _ collectionView: UICollectionView,
        heightForPhotoAtIndexPath indexPath:IndexPath) -> CGFloat {
        return items[indexPath.item].estimatedThumbnailHeight + 82
    }
}

