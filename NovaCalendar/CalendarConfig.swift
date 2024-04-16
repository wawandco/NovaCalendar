import Combine
import SwiftUI

/// Configuration class for calendar appearance
public class CalendarConfig: ObservableObject {
    
    public init() {}
    
    /// Singleton instance
    public static var shared = CalendarConfig()
    
    /// Background color of day buttons
    @Published public var dayButtonBackground = Color.backgroundItem
    
    /// Text color of day buttons
    @Published public var dayTextColor = Color.mainText
    
    /// Font for the text of day buttons
    @Published public var dayTextFont: Font = .caption
    
    /// Color for selected day buttons
    @Published public var selectedDayButtonColor = Color.selectedIndicator
    
    /// Text color for selected day buttons
    @Published public var selectedDayTextColor = Color.selectedIndicator
    
    /// Border color for selected day buttons
    @Published public var selectedDayBorderColor = Color.selectedIndicator
    
    /// Custom tag view to be displayed on day buttons
    @Published public var customTagView: CustomCalendarView? = nil
    
    /// Additional custom properties for MonthView
    
    /// Text color for month view
    @Published public var monthViewTextColor = Color.mainText
    
    /// Font for the text of month view
    @Published public var monthViewTextFont: Font = .title3
    
    /// Button color for navigating to the previous/next month
    @Published public var monthViewButtonColor = Color.mainText
    
    /// Size of the buttons for navigating to the previous/next month
    @Published public var monthViewButtonSize: CGFloat = 20
    
    /// Font for the buttons for navigating to the previous/next month
    @Published public var monthViewButtonFont: Font = .title3

    
    // Additional custom properties for WeekDaysView
    
    /// Text color for week day names
    @Published public var weekDayTextColor = Color.mainText
    
    /// Background color for week day names
    @Published public var weekDayBackgroundColor = Color.background
    
    /// Font for the week day names
    @Published public var weekDayFont: Font = .caption
}
