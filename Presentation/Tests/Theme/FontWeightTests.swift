import XCTest
@testable import Presentation

class FontWeightTests: XCTestCase {

    func test_fontFamily_shouldBeOpenSans() {
        XCTAssertEqual(FontWeight.regular.fontFamily, "OpenSans")
        XCTAssertEqual(FontWeight.light.fontFamily, "OpenSans")
        XCTAssertEqual(FontWeight.semibold.fontFamily, "OpenSans")
    }

    func test_fontName_shouldReturnTheProperValue() {
        XCTAssertEqual(FontWeight.regular.fontName, "OpenSans")
        XCTAssertEqual(FontWeight.light.fontName, "OpenSans-Light")
        XCTAssertEqual(FontWeight.semibold.fontName, "OpenSans-Semibold")
    }

    func test_weight_shouldReturnTheMatchingSystemWeight() {
        XCTAssertEqual(FontWeight.regular.weight, UIFont.Weight.regular)
        XCTAssertEqual(FontWeight.light.weight, UIFont.Weight.light)
        XCTAssertEqual(FontWeight.semibold.weight, UIFont.Weight.semibold)
    }
}
