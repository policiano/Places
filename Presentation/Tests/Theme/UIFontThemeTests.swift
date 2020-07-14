import XCTest
@testable import Presentation

class UIFontThemeTests: XCTestCase {

    func test_themeFonts_shouldReturnTheProperFont() {
        XCTAssertEqual(UIFont.heading1.fontName, "OpenSans-Light")
        XCTAssertEqual(UIFont.heading1.pointSize, 32)

        XCTAssertEqual(UIFont.heading2.fontName, "OpenSans-SemiBold")
        XCTAssertEqual(UIFont.heading2.pointSize, 16)

        XCTAssertEqual(UIFont.body1.fontName, "OpenSans-Light")
        XCTAssertEqual(UIFont.body1.pointSize, 16)

        XCTAssertEqual(UIFont.body2.fontName, "OpenSans-Light")
        XCTAssertEqual(UIFont.body2.pointSize, 14)

        XCTAssertEqual(UIFont.body3.fontName, "OpenSans-Regular")
        XCTAssertEqual(UIFont.body3.pointSize, 14)

        XCTAssertEqual(UIFont.caption.fontName, "OpenSans-Regular")
        XCTAssertEqual(UIFont.caption.pointSize, 14)
    }
}
