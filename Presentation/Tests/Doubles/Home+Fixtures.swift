@testable
import Presentation
import Foundation
import UIKit

extension Home.GetPlaces.ViewModel.Item {
    static func fixture(
        name: String = "",
        category: String? = "",
        stars: Int = 0,
        score: String = "",
        thumbnailURL: URL? = nil,
        estimatedThumbnailHeight: CGFloat = 0
    ) -> Self {
        .init(name: name, category: category, stars: stars, score: score, thumbnailURL: thumbnailURL, estimatedThumbnailHeight: estimatedThumbnailHeight)
    }
}
