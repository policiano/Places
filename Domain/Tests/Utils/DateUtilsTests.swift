import Foundation
import XCTest

@testable import Domain

final class DateUtilsTests: XCTestCase {
    let sut = Date(timeIntervalSince1970: 0)

    func test_addingSeconds_shouldReturnAValidDate() {
        let anyValue = TimeInterval.anyValue
        let actualResult = sut.addingSeconds(anyValue)

        XCTAssertEqual(actualResult, sut.addingTimeInterval(anyValue))
    }

    func test_addingMinutes_shouldReturnAValidDate() {
        let anyValue = Int.anyValue
        let actualResult = sut.addingMinutes(anyValue)

        XCTAssertEqual(actualResult.timeIntervalSince1970, TimeInterval(anyValue) * 60)
    }

    func test_addingHours_shouldReturnAValidDate() {
        let anyValue = Int.anyValue
        let actualResult = sut.addingHours(anyValue)

        XCTAssertEqual(actualResult.timeIntervalSince1970, TimeInterval(anyValue) * 60 * 60)
    }
}
