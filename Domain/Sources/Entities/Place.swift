import Foundation

public struct Place {
    public let name: String
    public let category: String?
    public let thumbnailURL: URL?
    public let score: Decimal

    public init(
        name: String,
        category: String?,
        thumbnailURL: URL?,
        score: Decimal
    ) throws {
        guard 0...5 ~= score else {
            throw Error.scoreOutOfBounds
        }

        guard name.isEmpty == false else {
            throw Error.emptyName
        }

        self.name = name
        self.category = category
        self.thumbnailURL = thumbnailURL
        self.score = score
    }

    public enum Error: LocalizedError {
        case scoreOutOfBounds
        case emptyName

        var localizedDescription: String {
            switch self {
            case .scoreOutOfBounds:
                return "The score should be between 0 and 5"
            case .emptyName:
                return "The place name should not be empty"
            }
        }
    }
}
