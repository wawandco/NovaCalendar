import SwiftUI

// Extend the Date struct to add custom functionalities
extension Date {
    // Get the day of the month
    var day: Int {
        return Calendar.current.component(.day, from: self)
    }
    
    // Get the abbreviated name of the day of the week
    var dayName: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEE"
        return dateFormatter.string(from: self)
    }
    
    // Get the month of the year
    var month: Int {
        return Calendar.current.component(.month, from: self)
    }
    
    // Get the name of the month
    var monthName: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM"
        return dateFormatter.string(from: self)
    }
    
    // Get the year
    var year: Int {
        return Calendar.current.component(.year, from: self)
    }
    
    // Check if the date is today
    var isToday: Bool {
        return Calendar.current.isDateInToday(self)
    }
    
    // Convert date to milliseconds since epoch
    var milliseconds: Int64 {
        return Int64(self.timeIntervalSince1970 * 1000.0)
    }
    
    // Get the hour component of the date
    var hour: Int {
        return Calendar.current.component(.hour, from: self)
    }
    
    // Get the minute component of the date
    var minute: Int {
        return Calendar.current.component(.minute, from: self)
    }
    
    // Get the start date of the month for a given date
    func startOfMonth() -> Date {
        return Calendar.current.date(from: Calendar.current.dateComponents([.year, .month], from: self)) ?? self
    }
    
    // Add a number of months to a date
    func adding(months: Int) -> Date? {
        return Calendar.current.date(byAdding: .month, value: months, to: self)
    }
    
    // Format the date as a string in "yyyy-MM-dd" format
    func formatDateString() -> String {
        let formattedMonth = String(format: "%02d", self.month)
        let formattedDay = String(format: "%02d", self.day)
        return "\(self.year)-\(formattedMonth)-\(formattedDay)"
    }
    
    // Get an array of dates representing the days in a month
    func daysInMonth(date: Date) -> [Date] {
        var dates: [Date] = []
        let dayInSeconds = 86400
        
        let startOfMonth = date.startOfMonth()
        let weekdayOfFirstDay = Calendar.current.component(.weekday, from: startOfMonth)
        
        // Add placeholders for days before the start of the month
        for i in 1..<weekdayOfFirstDay {
            dates.append(startOfMonth.addingTimeInterval(TimeInterval(-(weekdayOfFirstDay - i) * dayInSeconds)))
        }
        
        // Add days of the current month
        let range = Calendar.current.range(of: .day, in: .month, for: startOfMonth)
        for day in 1...(range?.count ?? 0) {
            if let currentDate = Calendar.current.date(byAdding: .day, value: day - 1, to: startOfMonth) {
                dates.append(currentDate)
            }
        }
        
        // Add placeholders for days until the next month's first day
        let lastDayOfMonth = dates.last ?? Date.now
        let remainingDays = (7 - (dates.count % 7)) % 7
        if remainingDays > 0 {
            for i in 1...remainingDays {
                dates.append(lastDayOfMonth.addingTimeInterval(TimeInterval(i * dayInSeconds)))
            }
        }

        return dates
    }
}
