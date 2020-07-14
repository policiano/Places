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


protocol Random {
    static var anyValue: Self { get }
}

extension Double: Random {
    static var anyValue: Self {
        Double.random(in: -10 ..< 10)
    }
}

extension Int: Random {
    static var anyValue: Self {
        Int.random(in: -100_000 ..< 100_000)
    }
}
