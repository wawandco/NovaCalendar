import SwiftUI

/// View representing a horizontal calendar.
public struct HorizontalCalendar: View {
    @ObservedObject var config = CalendarConfig.shared
    @ObservedObject var data = CalendarData.shared
    
    /// Initialize the horizontal calendar with custom configuration and data.
    public init(config: CalendarConfig = CalendarConfig.shared, data: CalendarData) {
        self.config = config
        self.data = data
    }
    
    public var body: some View {
        VStack(spacing: 0) {
            MonthView(config: config, data: data)
            WeekDaysView(config: config)
            VStack {
                ForEach(data.splitMonthInWeeks(data.monthDates, size: 7), id: \.self) { week in
                    HStack {
                        ForEach(week, id: \.self) { day in
                            DayButtonView(config: config, data: data, date: day)
                        }
                    }
                }
            }
            .frame(maxWidth: .infinity)
            .padding(0)
        }
        .padding(.vertical, 1)
        .onAppear {
            data.setDateInfo(date: data.currentDay)
        }
        .onChange(of: data.currentDay) { _ in
            data.setDateInfo(date: data.currentDay)
        }
        .onChange(of: data.isMonthLoad) { _ in
            data.setDateInfo(date: data.currentDay)
        }
    }
}

struct HorizontalCalendar_Previews: PreviewProvider {
    @ObservedObject static var data = CalendarData()
    @ObservedObject static var config = CalendarConfig()
    
    static var previews: some View {
        HorizontalCalendar(config: config ,data: data)
    }
}

