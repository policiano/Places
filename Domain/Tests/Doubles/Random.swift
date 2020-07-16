import Foundation

protocol Random {
    static var anyValue: Self { get }
}

extension Double: Random {
    static var anyValue: Self {
        Double.random(in: -10 ..< 10)
    }
}

extension Int: Random {
    static var anyValue: Self {
        Int.random(in: -100_000 ..< 100_000)
    }
}

extension String: Random {
    static var anyValue: String {
        let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        return String((0..<20).map{ _ in letters.randomElement()! })
    }
}
