@testable
import Domain
import Foundation
import XCTest

final class GetPlacesUseCaseTest: XCTestCase {
    typealias PlacesResult = Result<[Place], Error>
    private let spy = PlacesRepositorySpy()
    private lazy var sut = GetPlaces(repository: spy)

    func test_onExecute_withFailureResult_shouldReturnTheFailure() {
        let expectedError = ErrorDummy()
        spy.getPlacesResultToBeReturned = .failure(expectedError)

        var actualResult: PlacesResult?
        sut.execute {
            actualResult = $0
        }

        XCTAssertTrue(spy.getPlacesCalled)
        XCTAssertEqual(actualResult?.error as? ErrorDummy, expectedError)
    }

    func test_onExecute_withSuccessResult_shouldReturnTheFailure() throws {
        let expectedPlaces: [Place] = [try .fixture(), try .fixture()]
        spy.getPlacesResultToBeReturned = .success(expectedPlaces)

        var actualResult: PlacesResult?
        sut.execute {
            actualResult = $0
        }

        XCTAssertTrue(spy.getPlacesCalled)
        XCTAssertEqual(actualResult?.value?[0].name, expectedPlaces[0].name)
        XCTAssertEqual(actualResult?.value?[0].category, expectedPlaces[0].category)
        XCTAssertEqual(actualResult?.value?[0].thumbnailURL, expectedPlaces[0].thumbnailURL)
        XCTAssertEqual(actualResult?.value?[0].score, expectedPlaces[0].score)

        XCTAssertEqual(actualResult?.value?[1].name, expectedPlaces[1].name)
        XCTAssertEqual(actualResult?.value?[1].category, expectedPlaces[1].category)
        XCTAssertEqual(actualResult?.value?[1].thumbnailURL, expectedPlaces[1].thumbnailURL)
        XCTAssertEqual(actualResult?.value?[1].score, expectedPlaces[1].score)
    }
}
