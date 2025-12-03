//
//  Date+Display.swift
//  MonashDashboard
//
//  Created by Brent Chionh on 1/12/2025.
//

import Foundation

extension Date {
    
    /// Formats the date to return a specific day string for 'Today' vs any other date.
    /// - Returns: String for display
    func formattedForDay() -> String {
        let calendar = Calendar.current

        if calendar.isDateInToday(self) {
            let formatter = DateFormatter()
            formatter.dateFormat = "d MMMM"
            return "Today, \(formatter.string(from: self))"
        } else {
            let formatter = DateFormatter()
            formatter.dateFormat = "EEE, d MMMM"
            return formatter.string(from: self)
        }
    }
    
    /// Formats date to return a time string according to the expected shortening
    /// depending on if the minutes > 0
    /// e.g. 5pm & 5:30pm
    func shortFormattedTime() -> String {
        let calendar = Calendar.current
        let comps = calendar.dateComponents([.hour, .minute], from: self)
        let formatter = DateFormatter()
        if comps.minute == 0 {
            formatter.dateFormat = "ha" // 5pm
        } else {
            formatter.dateFormat = "h:mma" //5:30pm
        }
        return formatter.string(from: self)
    }
}
