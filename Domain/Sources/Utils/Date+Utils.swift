import Foundation

extension Date {
    func addingSeconds(_ seconds: TimeInterval) -> Date {
        addingTimeInterval(seconds)
    }

    func addingMinutes(_ minutes: Int) -> Date {
        addingSeconds(TimeInterval(minutes) * 60)
    }

    func addingHours(_ hours: Int) -> Date {
        addingMinutes(hours * 60)
    }
}
