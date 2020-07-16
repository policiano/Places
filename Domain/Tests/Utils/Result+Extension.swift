import Foundation

extension Result {
    var value: Success? {
        try? get()
    }

    var error: Failure? {
        if case .failure(let error) = self {
            return error
        }
        return nil
    }
}
