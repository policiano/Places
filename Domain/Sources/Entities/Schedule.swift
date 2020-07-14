import Foundation

public struct Schedule {
    public enum WeekDay {
        case monday
        case thuesday
        case wednesday
        case thursday
        case friday
        case saturday
        case sunday
    }

    public struct Interval {
        public let open: Date
        public let close: Date

        init(open: Date, close: Date) throws {
            guard close >= open.addingHours(1) else {
                throw Error.inconsistentInterval
            }
            self.open = open
            self.close = close
        }

        enum Error: LocalizedError {
            case inconsistentInterval

            var localizedDescription: String {
                switch self {
                case .inconsistentInterval:
                    return "The close date should be at least 1 hour greather than the open date"
                }
            }
        }

    }

    public let interval: Interval
    public let weekDays: [WeekDay]
}

