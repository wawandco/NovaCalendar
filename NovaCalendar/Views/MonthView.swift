import SwiftUI

struct MonthView: View {
    @ObservedObject var config = CalendarConfig.shared
    @ObservedObject var data = CalendarData.shared
    
    var body: some View {
        
        HStack {
            Button(action: {
                self.data.currentDay = self.data.currentDay?.adding(months: -1)?.startOfMonth()
                self.data.isMonthLoad = true
            }) {
                Image(systemName: "chevron.left")
                    .foregroundColor(config.monthViewButtonColor)
                    .font(config.monthViewButtonFont)
            }
            
            Text("\(data.currentDay?.monthName ?? "") \(data.currentDay?.year.description ?? "")")
                .font(config.monthViewTextFont)
                .foregroundColor(config.monthViewTextColor)
                .frame(maxWidth: .infinity)
            
            Button(action: {
                self.data.currentDay = self.data.currentDay?.adding(months: 1)?.startOfMonth()
                self.data.isMonthLoad = true
            }) {
                Image(systemName: "chevron.right")
                    .foregroundColor(config.monthViewButtonColor)
                    .font(config.monthViewButtonFont)
            }
        }
        .padding(16)
        .frame(maxWidth: .infinity)
        .background(Color.background)
    }
}

struct MonthView_Preview: PreviewProvider {
    @ObservedObject static var data = CalendarData.shared

    static var previews: some View {
        MonthView(data: data)
    }
}
