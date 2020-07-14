import UIKit

protocol HomeDisplayLogic {
    func displayPlaces(viewModel: Home.GetPlaces.ViewModel)
}

final class HomeCollectionViewController: UICollectionViewController {

    private let presenter: HomePresentationLogic

    init(presenter: HomePresentationLogic) {
        self.presenter = presenter
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) { nil }

    override func viewDidLoad() {
        presenter.presentPlaces(request: .init())
    }

    private var items: [Home.GetPlaces.ViewModel.Item] = [] {
        didSet {
            collectionView.reloadData()
        }
    }

    // MARK: Collection View

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
}

extension HomeCollectionViewController: HomeDisplayLogic {
    func displayPlaces(viewModel: Home.GetPlaces.ViewModel) {
        items = viewModel.items
    }
}
