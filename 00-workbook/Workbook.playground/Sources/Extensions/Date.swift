import Foundation

public extension Date {
    
    // Call `Date().ninetyDayRange.startDate` to use
    var ninetyDayRange: (startDate: Date, endDate: Date) {
        (
            Calendar.current.date(byAdding: .day, value: -90, to: self)!, // StartDate
            Calendar.current.date(byAdding: .day, value: 1, to: self)! // EndDate
        )
    }
    
    static var clientCalendar: Calendar {
        
        var cal = Calendar(identifier: .gregorian)
        cal.timeZone = TimeZone.current
        return cal
    }
    
}

