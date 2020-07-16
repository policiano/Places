@testable
import Domain
import Foundation

extension Place {
    public static func fixture(
        name: String = .anyValue,
        category: String? = .anyValue,
        thumbnailURL: URL? = nil,
        score: Decimal = 5
    ) throws -> Place {
        try .init(
            name: name,
            category: category,
            thumbnailURL: thumbnailURL,
            score: score
        )
    }
}
