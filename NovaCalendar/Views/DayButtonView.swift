import SwiftUI

// View representing a day button in the calendar
struct DayButtonView: View {
    @ObservedObject var config = CalendarConfig.shared
    @ObservedObject var data = CalendarData.shared
    @State var date: Date?
    @State var isCustomViewVisible = false
    
    var body: some View {
        // Button representing a day in the calendar
        Button(action: {
            self.data.currentDay = self.date
            self.data.isMonthLoad = false
        }) {
            VStack(spacing: 0) {
                Text(date?.day.description ?? "")
                    .foregroundStyle(data.currentDay?.monthName == date?.monthName ? config.dayTextColor : .gray)
                    .font(config.dayTextFont)
                    .padding(8)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
                
                // Display custom tag view if available
                config.customTagView?.getTagView(count: self.getTagCount())
                    .opacity(self.shouldDisplayCustomView() ? 1 : 0)
                    .frame(height: 30)
                    .frame(maxWidth: .infinity, maxHeight: .infinity ,alignment: .center)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .border(self.isSelectedDay() ? config.selectedDayBorderColor : .clear , width: 3)
        }
        .background(config.dayButtonBackground)
        .frame(height: 70)
        .onChange(of: data.customDayDates) { _ in
            withAnimation {
                self.isCustomViewVisible = self.shouldDisplayCustomView()
            }
        }
    }
    
    // Check if the day button represents the currently selected day
    private func isSelectedDay() -> Bool {
        return date?.formatDateString() == data.currentDay?.formatDateString()
    }
    
    // Check if custom view should be displayed for the day button
    private func shouldDisplayCustomView() -> Bool {
        return self.getTagCount() > 0
    }
    
    // Get count of custom tags for the day button
    private func getTagCount() -> Int {
        print(data.customDayDates.description, date?.description ?? "")
        return self.data.customDayDates.filter { $0.formatDateString() == date?.formatDateString() }.count
    }
}


struct DayButtonView_Previews: PreviewProvider {
    @ObservedObject static var data = CalendarData.shared
    @ObservedObject static var config = CalendarConfig.shared
    static var previews: some View {
        return DayButtonView(config: config, data: data ,date: Date.now)

    }
}
