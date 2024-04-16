import Foundation
import SwiftUI

struct WeekDaysView: View {
    var days = DateFormatter().shortWeekdaySymbols ?? []
    @ObservedObject var config = CalendarConfig.shared
    
    var body: some View {
        
        HStack(spacing: 0) {
            ForEach(days, id: \.self) {day in
                Text(day)
                    .fixedSize()
                    .font(config.weekDayFont)
                    .lineLimit(1)
                    .foregroundColor(config.weekDayTextColor)
                    .padding()
                    .frame(maxWidth: .infinity)
            }
        }
        .background(config.weekDayBackgroundColor)
        .padding(0)
    }
}

#Preview {
    WeekDaysView()
}
