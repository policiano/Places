import Domain
import Foundation
import UIKit

protocol HomePresentationLogic {
    func presentPlaces(request: Home.GetPlaces.Request)
}

class HomePresenter: HomePresentationLogic {
    weak var display: HomeDisplayLogic?

    private let getPlaces: GetPlacesUseCase

    init(getPlaces: GetPlacesUseCase) {
        self.getPlaces = getPlaces
    }

    func presentPlaces(request: Home.GetPlaces.Request) {
        typealias ViewModel = Home.GetPlaces.ViewModel
        getPlaces.execute { [weak self] in
            guard let self = self else { return }

            let viewModel: ViewModel
            switch $0 {
            case .success(let places) where places.isEmpty == false:
                viewModel = .content(places.compactMap(ViewModel.Item.init))
            default:
                viewModel = .empty(L10n.Home.Places.empty)
            }

            self.display?.displayPlaces(viewModel: viewModel)
        }
    }
}

extension Home.GetPlaces.ViewModel.Item {
    init(place: Place) {
        name = place.name
        category = place.category
        stars = NSDecimalNumber(decimal: place.score).intValue

        let formatter = NumberFormatter()
        formatter.numberStyle = NumberFormatter.Style.decimal
        formatter.roundingMode = NumberFormatter.RoundingMode.floor
        formatter.decimalSeparator = "."
        formatter.maximumFractionDigits = 2

        score = formatter.string(from: NSDecimalNumber(decimal: place.score)) ?? ""
        estimatedThumbnailHeight = CGFloat(place.thumbnail?.estimatedHeight ?? 180)
        thumbnailURL = place.thumbnail?.url
    }
}
