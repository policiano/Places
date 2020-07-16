@testable
import Presentation
import Foundation

final class HomePresentationLogicSpy: HomePresentationLogic {
    private(set) var presentPlacesCalled = false
    private(set) var presentPlacesRequestPassed: Home.GetPlaces.Request?
    func presentPlaces(request: Home.GetPlaces.Request) {
        presentPlacesCalled = true
        presentPlacesRequestPassed = request
    }
}
