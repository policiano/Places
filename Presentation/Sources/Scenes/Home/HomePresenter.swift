import Foundation

protocol HomePresentationLogic {
    func presentPlaces(request: Home.GetPlaces.Request)
}

class HomePresenter: HomePresentationLogic {
    weak var display: HomeDisplayLogic?

    func presentPlaces(request: Home.GetPlaces.Request) {
        typealias Item = Home.GetPlaces.ViewModel.Item

        let items: [Item] = [
            .init(name: "Café Escritório", category: "Coworking", stars: 5, score: "5", photoHight: 214),
            .init(name: "Hangar", category: "Restaurante", stars: 4, score: "4", photoHight: 136),
            .init(name: "Padaria Pelicano", category: "Padaria", stars: 3, score: "3.8", photoHight: 152),
            .init(name: "KPOPKA", category: "Sucos naturais", stars: 2, score: "2", photoHight: 201),
            .init(name: "Baianera", category: "Restaurante", stars: 1, score: "1", photoHight: 171),
            .init(name: "Garage", category: "Cafeteria", stars: 0, score: "0.7", photoHight: 136),
            .init(name: "Passaí", category: "Sucos naturais", stars: 3, score: "3", photoHight: 136),
            .init(name: "Simple", category: "Produtos Naturais", stars: 4, score: "4.5", photoHight: 214),
            .init(name: "Café Kitsumé", category: "Cafeteria", stars: 5, score: "5", photoHight: 187),
            .init(name: "Cantina do Leo", category: "Restaurante", stars: 6, score: "5", photoHight: 214)
        ]//.shuffled()

        display?.displayPlaces(viewModel: .init(items: items))
    }
}
