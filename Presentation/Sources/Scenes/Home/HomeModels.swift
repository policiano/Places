import Foundation
import UIKit

enum Home {
    enum GetPlaces {
        struct Request {

        }
        struct ViewModel {
            struct Item {
                let name: String
                let category: String
                let stars: Int
                let score: String
                let photoHight: CGFloat
            }

            let items: [Item]
        }
    }
}
