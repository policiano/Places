@testable
import Presentation
import Foundation
import Domain
import XCTest

final class HomePresenterTests: XCTestCase {
    private let displaySpy = HomeDisplayLogicSpy()
    private let useCaseSpy = GetPlacesUseCaseSpy()
    private lazy var sut: HomePresenter = {
        let presenter = HomePresenter(getPlaces: useCaseSpy)
        presenter.display = displaySpy
        return presenter
    }()

    func test_onPresentPlaces_withSuccess_shouldCallUseCaseAndPassDataToTheView() throws {
        let place = try Place.fixture(score: 3.5)
        useCaseSpy.executeResultToBeReturned = .success([place])
        
        sut.presentPlaces(request: .init())

        let actualContent = displaySpy.displayPlacesViewModelPassed?.items
        XCTAssertTrue(useCaseSpy.executeCalled)
        XCTAssertTrue(displaySpy.displayPlacesCalled)
        XCTAssertEqual(actualContent?[0].name, place.name)
        XCTAssertEqual(actualContent?[0].category, place.category)
        XCTAssertEqual(actualContent?[0].score, "3.5")
        XCTAssertEqual(actualContent?[0].stars, 3)
    }

    func test_onPresentPlaces_withEmptySuccess_shouldCallUseCaseAndPassAMessageToTheView() throws {
        useCaseSpy.executeResultToBeReturned = .success([])

        sut.presentPlaces(request: .init())

        XCTAssertTrue(useCaseSpy.executeCalled)
        XCTAssertTrue(displaySpy.displayPlacesCalled)
        XCTAssertEqual(displaySpy.displayPlacesViewModelPassed?.message, L10n.Home.Places.empty)
    }

    func test_onPresentPlaces_withFailure_shouldCallUseCaseAndPassAMessageToTheView() throws {
        useCaseSpy.executeResultToBeReturned = .failure(ErrorDummy())

        sut.presentPlaces(request: .init())

        XCTAssertTrue(useCaseSpy.executeCalled)
        XCTAssertTrue(displaySpy.displayPlacesCalled)
        XCTAssertEqual(displaySpy.displayPlacesViewModelPassed?.message, L10n.Home.Places.empty)
    }
}

extension Home.GetPlaces.ViewModel {
    var items: [Item]? {
        if case .content(let items) = self {
            return items
        }
        return nil
    }

    var message: String? {
        if case .empty(let message) = self {
            return message
        }
        return nil
    }
}

final class HomeDisplayLogicSpy: HomeDisplayLogic {
    private(set) var displayPlacesCalled = false
    private(set) var displayPlacesViewModelPassed: Home.GetPlaces.ViewModel?
    func displayPlaces(viewModel: Home.GetPlaces.ViewModel) {
        displayPlacesCalled = true
        displayPlacesViewModelPassed = viewModel
    }
}
