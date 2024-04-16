# ``NovaCalendar``

NovaCalendar is a custom calendar representation for iOS, iPadOS, and macOS that allows you to display and interact with dates.

## Installation

NovaCalendar can be installed via CocoaPods or Swift Package Manager.

### CocoaPods

Add the following line to your Podfile:

```ruby
pod 'NovaCalendar'
```

Then, run the following command:

```ruby
$ pod install
```

### Swift Package Manager

NovaCalendar can also be installed via Swift Package Manager. Add the following line to your Package.swift file:

```swift
.package(url: "https://github.com/wawandco/NovaCalendar.git", from: "1.0.0")
```

Then, add "NovaCalendar" to the dependencies array of your target.

## Overview

NovaCalendar is a custom calendar representation for iOS, iPadOS,macOS that allows you to display and interact with dates. It provides a horizontal calendar view that displays the current month and allows you to swipe left or right to navigate between months. It also allows you to select a date and receive a callback when a date is selected.

You can create a calendar using the init(config: CalendarConfig, data: CalendarData) initializer, where `config` is a `CalendarConfig` object that defines the appearance and behavior of the calendar, and `data` is a `CalendarData` object that provides the data to display in the calendar.

## Usage

### Horizontal Calendar

Horizontal Calendar
The HorizontalCalendar class provides a horizontal calendar view that displays the current month and allows you to swipe left or right to navigate between months. It also allows you to select a date and receive a callback when a date is selected.

```swift
let config = CalendarConfig()
let data = CalendarData()
let calendar = HorizontalCalendar(config: config, data: data)
```

### Handling calendar data

You can handle date selection by providing a callback that is called when a date is selected. The callback provides the selected date as a parameter, allowing you to perform any actions based on the selected date.

```swift
let data = CalendarData()
let config = CalendarConfig()

let calendar = HorizontalCalendar(config: config, data: data)
Text("Selected date: \(calendar.selectedDate?.description ?? "")")
```

### Adding custom styles

You can customize the appearance of the calendar by providing a `CalendarConfig` object that defines the appearance and behavior of the calendar. The `CalendarConfig` object allows you to customize the appearance of the calendar, such as the font, colors, and size of the text, as well as the spacing between the cells.

```swift
let data = CalendarData()
let config = CalendarConfig()

config.textColor = .black
config.selectedTextColor = .white
config.selectedBackgroundColor = .blue
config.todayTextColor = .red

let calendar = HorizontalCalendar(config: config, data: data)
```


### Integrating Custom Views into Date Cells

Users can now personalize their calendar experience by adding custom views to specific date cells. This feature is facilitated through the use of the CalendarConfig object and a view conforming to the CustomCalendarView protocol.

Set a custom view to be displayed within date cells by assigning an instance of a view conforming to CustomCalendarView to the customTagView property


```swift
let config = CalendarConfig()
config.customTagView = CustomView()
```

Ensure that the calendar has access to the dates for which custom views should be displayed. This is accomplished through the CalendarData object

```swift
let data = CalendarData()
data.customDayDates = [Date.now]
```

### License

NovaCalendar is released under the MIT license. See LICENSE for details.
