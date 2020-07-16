@testable
import Presentation
import Foundation
import XCTest

final class ScoreViewSizeTests: XCTestCase {

    func test_regularSize_shouldReturnTheProperImageAsset() {
        let sut = ScoreViewSize.regular

        let actualGoldImage = sut.goldStarImage
        let actualGreyImage = sut.grayStarImage

        XCTAssertEqual(actualGoldImage.name, Asset.icGoldStarRegular.name)
        XCTAssertEqual(actualGreyImage.name, Asset.icGrayStarRegular.name)
    }

    func test_smallSize_shouldReturnTheProperImageAsset() {
        let sut = ScoreViewSize.small

        let actualGoldImage = sut.goldStarImage
        let actualGreyImage = sut.grayStarImage

        XCTAssertEqual(actualGoldImage.name, Asset.icGoldStarSmall.name)
        XCTAssertEqual(actualGreyImage.name, Asset.icGrayStarSmall.name)
    }
}
