import SwiftUI

public protocol CustomCalendarView {
    var currentDay : Date? { get set }
    
    func getTagView(count: Int) -> AnyView
}
