@testable
import Domain
import Foundation

extension Place {
    public static func fixture(
        name: String = .anyValue,
        category: String? = .anyValue,
        thumbnail: Thumbnail? = nil,
        score: Decimal = 5
    ) throws -> Place {
        try .init(
            name: name,
            category: category,
            thumbnail: thumbnail,
            score: score
        )
    }
}
