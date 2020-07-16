import Foundation

public protocol GetPlacesUseCase {
    func execute(completion: @escaping (Result<[Place], Error>) -> Void)
}

public final class GetPlaces {
    private let repository: PlacesRepository

    public init(repository: PlacesRepository) {
        self.repository = repository
    }
}

extension GetPlaces: GetPlacesUseCase {
    public func execute(completion: @escaping (Result<[Place], Error>) -> Void) {
        repository.getPlaces(completion: completion)
    }
}
