@testable
import Domain
import Foundation

public final class GetPlacesUseCaseSpy: GetPlacesUseCase {
    public init() { }

    public private(set) var executeCalled = false
    public var executeResultToBeReturned: Result<[Place], Error>?
    public func execute(completion: @escaping (Result<[Place], Error>) -> Void) {
        executeCalled = true
        if let result = executeResultToBeReturned {
            completion(result)
        }
    }
}
