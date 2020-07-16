@testable
import Presentation
import Foundation
import XCTest

final class HomeCollectionViewControllerTests: XCTestCase {
    private typealias ViewModel = Home.GetPlaces.ViewModel

    private let presenterSpy = HomePresentationLogicSpy()
    private lazy var sut = HomeCollectionViewController(presenter: presenterSpy)

    func test_onDisplayPlaces_withoutItems_theCollectionShouldUpdateProperly() {
        let viewModel = ViewModel.content([])

        sut.displayPlaces(viewModel: viewModel)

        XCTAssertEqual(sut.numberOfSections(in: sut.collectionView), 1)
        XCTAssertEqual(sut.collectionView(sut.collectionView, numberOfItemsInSection: 0), 0)
    }

    func test_onDisplayPlaces_withOneItems_theCollectionShouldUpdateProperly() {
        let viewModel = ViewModel.content([.fixture()])

        sut.displayPlaces(viewModel: viewModel)

        XCTAssertEqual(sut.numberOfSections(in: sut.collectionView), 1)
        XCTAssertEqual(sut.collectionView(sut.collectionView, numberOfItemsInSection: 0), 1)
    }

    func test_onDisplayPlaces_withMoreThanOneItems_theCollectionShouldUpdateProperly() {
        let viewModel = ViewModel.content([
            .fixture(), .fixture()
        ])

        sut.displayPlaces(viewModel: viewModel)

        XCTAssertEqual(sut.numberOfSections(in: sut.collectionView), 1)
        XCTAssertEqual(sut.collectionView(sut.collectionView, numberOfItemsInSection: 0), 2)
    }

    func test_viewDidLoad_shouldCallPresentPlaces() {
        sut.viewDidLoad()

        XCTAssertTrue(presenterSpy.presentPlacesCalled)
        XCTAssertEqual(sut.title, "HOME")
        XCTAssertEqual(sut.collectionView.backgroundColor, UIColor.systemBackground)
    }
}
