import Foundation
import UIKit

enum Home {
    enum GetPlaces {
        struct Request {

        }
        enum ViewModel {
            struct Item {
                let name: String
                let category: String?
                let stars: Int
                let score: String
                let thumbnailURL: URL?
                let estimatedThumbnailHeight: CGFloat
            }

            case content([Item])
            case empty(String)
        }
    }
}
