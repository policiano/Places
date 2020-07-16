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
        
    }
}
