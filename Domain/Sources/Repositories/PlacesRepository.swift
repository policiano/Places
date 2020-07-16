import Foundation

public protocol PlacesRepository {
    func getPlaces(completion: @escaping (Result<[Place], Error>) -> Void)
}
