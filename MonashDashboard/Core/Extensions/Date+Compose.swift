//
//  Date+Compose.swift
//  MonashDashboard
//
//  Created by Brent Chionh on 1/12/2025.
//

import Foundation

extension Date {
    
    // compose a date from components
    static func compose(
        _ year: Int,
        _ month: Int,
        _ day: Int,
        _ hour: Int,
        _ minute: Int = 0
    ) -> Date {
        var components = DateComponents()
        components.year = year
        components.month = month
        components.day = day
        components.hour = hour
        components.minute = minute
        let calendar = Calendar(identifier: .gregorian)
        return calendar.date(from: components)!
    }
}
