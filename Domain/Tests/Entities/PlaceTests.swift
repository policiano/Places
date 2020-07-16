@testable
import Domain
import Foundation
import XCTest

final class PlaceTests: XCTestCase {

    func test_initPlace_withScoreGratherThan5_shouldThrowAnError() {
        XCTAssertThrowsError(try Place(name: .anyValue, category: nil, thumbnailURL: nil, score: 6)) { error in
            XCTAssertEqual(error as? Place.Error, Place.Error.scoreOutOfBounds)
        }
    }

    func test_initPlace_withScoreLessThan0_shouldThrowAnError() {
        XCTAssertThrowsError(try Place(name: .anyValue, category: nil, thumbnailURL: nil, score: -1)) { error in
            XCTAssertEqual(error as? Place.Error, Place.Error.scoreOutOfBounds)
        }
    }

    func test_initPlace_withEmptyName_shouldThrowAnError() {
        XCTAssertThrowsError(try Place(name: "", category: nil, thumbnailURL: nil, score: 5)) { error in
            XCTAssertEqual(error as? Place.Error, Place.Error.emptyName)
        }
    }

    func test_initPlace_withValidConditions_shouldNotThrowError() {
        let anyString = String.anyValue

        var sut = try? Place(name: anyString, category: nil, thumbnailURL: nil, score: 4)
        XCTAssertEqual(sut?.name, anyString)
        XCTAssertNil(sut?.category)
        XCTAssertNil(sut?.thumbnailURL)

        sut = try? Place(name: anyString, category: anyString, thumbnailURL: nil, score: 3.5)
        XCTAssertEqual(sut?.name, anyString)
        XCTAssertEqual(sut?.category, anyString)
        XCTAssertNil(sut?.thumbnailURL)

        sut = try? Place(name: anyString, category: anyString, thumbnailURL: URL(fileURLWithPath: anyString), score: 3.5)
        XCTAssertEqual(sut?.name, anyString)
        XCTAssertEqual(sut?.category, anyString)
        XCTAssertEqual(sut?.thumbnailURL?.lastPathComponent, anyString)
    }
}
