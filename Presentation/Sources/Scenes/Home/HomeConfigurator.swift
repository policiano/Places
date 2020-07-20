import UIKit
import Domain

public final class HomeConfigurator {
    public init() { }

    public func resolve() -> UIViewController {
        let presenter = HomePresenter(getPlaces: resolveGetPlacesUseCase())
        let viewController = HomeCollectionViewController(presenter: presenter)
        presenter.display = viewController
        let navigationController = UINavigationController(rootViewController: viewController)
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]

        navigationController.navigationBar.titleTextAttributes = textAttributes
        navigationController.navigationBar.isTranslucent = false
        navigationController.navigationBar.backgroundColor = .white
        navigationController.navigationBar.barTintColor = DesignSystem.Color.acentBaseColor

        return navigationController
    }

    private func resolveGetPlacesUseCase() -> GetPlacesUseCase {
        let useCase = GetPlaces(repository: FakePlacesRepository())
        return useCase
    }
}

private class FakePlacesRepository: PlacesRepository {
    func getPlaces(completion: @escaping (Result<[Place], Error>) -> Void) {
        let url = URL(fileURLWithPath: "")
        let places: [Place] = [
            try? Place(name: "Café Escritório", category: "Coworking", thumbnail: .init(url: url, estimatedHeight: 214), score: 5),
            try? Place(name: "Hangar", category: "Restaurante", thumbnail: .init(url: url, estimatedHeight: 136), score: 4),
            try? Place(name: "Padaria Pelicano", category: "Padaria", thumbnail: .init(url: url, estimatedHeight: 152), score: 3.8),
            try? Place(name: "KPOPKA", category: "Sucos naturais", thumbnail: .init(url: url, estimatedHeight: 201), score: 2),
            try? Place(name: "Baianera", category: "Restaurante", thumbnail: .init(url: url, estimatedHeight: 201), score: 1)
        ].compactMap { $0 }
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            completion(.success(places))
        }
    }
}
