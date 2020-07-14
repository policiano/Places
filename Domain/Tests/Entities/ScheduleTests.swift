import Foundation
import XCTest

@testable import Domain

final class ScheduleTests: XCTestCase {
    private typealias Interval = Schedule.Interval

    func test_intervalInit_openShouldAtLeastOneHourGratherThanClose() {
        let open = Date(timeIntervalSince1970: 1)
        let close = Date(timeIntervalSince1970: 0)


        XCTAssertThrowsError(try Interval(open: open, close: close)) { actualError in
            XCTAssertEqual(
                (actualError as? Interval.Error)?.localizedDescription,
                Interval.Error.inconsistentInterval.localizedDescription
            )
        }
    }

    func test_intervalError_localizedDescription_shouldHaveValidDescription() {
        XCTAssertEqual(
            Interval.Error.inconsistentInterval.localizedDescription,
            "The close date should be at least 1 hour greather than the open date"
        )
    }
}

