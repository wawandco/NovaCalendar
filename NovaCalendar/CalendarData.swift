import Combine

/// Data class for calendar information
public class CalendarData: ObservableObject {
    
    public init() {}

    /// Singleton instance
    public static let shared = CalendarData()

    /// Currently selected day
    @Published public var currentDay: Date? = Date()
    
    /// Flag to indicate if month data is being loaded
    @Published public var isMonthLoad: Bool = false
    
    /// Array of dates for the current month
    @Published public var monthDates: [Date] = []
    
    /// Array of dates with custom data associated
    @Published public var customDayDates: [Date] = []
    
    /// Split month into weeks based on size
    func splitMonthInWeeks(_ month: [Date], size: Int) -> [[Date]] {
        return stride(from: 0, to: month.count, by: size).map {
            Array(month[$0 ..< Swift.min($0 + size, month.count)])
        }
    }
    
    /// Set date information for the calendar
    func setDateInfo(date: Date? = Date()) {
        let dates = Date().daysInMonth(date: date ?? Date())
        self.monthDates = dates
    }
}
