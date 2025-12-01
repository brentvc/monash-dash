//
//  Date+Display.swift
//  MonashDashboard
//
//  Created by Brent Chionh on 1/12/2025.
//

import Foundation

extension Date {
    
    func formattedForDay() -> String {
        let calendar = Calendar.current

        if calendar.isDateInToday(self) {
            let formatter = DateFormatter()
            formatter.dateFormat = "d MMMM"
            return "Today, \(formatter.string(from: self))"
        } else {
            let formatter = DateFormatter()
            formatter.dateFormat = "EEE d MMMM"
            return formatter.string(from: self)
        }
    }
}
