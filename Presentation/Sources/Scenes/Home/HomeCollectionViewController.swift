import UIKit

protocol HomeDisplayLogic: AnyObject {
    func displayPlaces(viewModel: Home.GetPlaces.ViewModel)
}

final class HomeCollectionViewController: UICollectionViewController {

    private let presenter: HomePresentationLogic

    init(presenter: HomePresentationLogic) {
        self.presenter = presenter
        super.init(collectionViewLayout: PinterestLayout())
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) { nil }

    override func viewDidLoad() {
        presenter.presentPlaces(request: .init())
        setup()
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
        (collectionView?.collectionViewLayout as? PinterestLayout)?.delegate = self

        title = L10n.Home.NavBar.title.uppercased()
        collectionView.backgroundColor = .systemBackground
        collectionView?.contentInset = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
        collectionView.register(PlaceCell.self, forCellWithReuseIdentifier: PlaceCell.identifier)
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

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        16
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        24
    }
}

extension HomeCollectionViewController: HomeDisplayLogic {
    func displayPlaces(viewModel: Home.GetPlaces.ViewModel) {
        items = viewModel.items
    }
}

extension HomeCollectionViewController: PinterestLayoutDelegate {
    func collectionView(
        _ collectionView: UICollectionView,
        heightForPhotoAtIndexPath indexPath:IndexPath) -> CGFloat {
        return items[indexPath.item].photoHight + 82
    }
}

