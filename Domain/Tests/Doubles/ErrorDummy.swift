import Foundation

struct ErrorDummy: Error, Identifiable, Equatable {
    let id = UUID()
    var localizedDescription: String = "Error"
}
