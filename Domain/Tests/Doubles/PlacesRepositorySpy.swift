@testable
import Domain
import Foundation

final class PlacesRepositorySpy: PlacesRepository {

    private(set) var getPlacesCalled = false
    var getPlacesResultToBeReturned: Result<[Place], Error>?
    func getPlaces(completion: @escaping (Result<[Place], Error>) -> Void) {
        getPlacesCalled = true
        if let result = getPlacesResultToBeReturned {
            completion(result)
        }
    }
}
