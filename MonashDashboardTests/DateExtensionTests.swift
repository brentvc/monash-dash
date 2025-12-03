//
//  DateExtensionTests.swift
//  MonashDashboardTests
//
//  Created by Brent Chionh on 2/12/2025.
//

import Foundation
import Testing
@testable import MonashDashboard

/// Tests the date extensions for formatting the display day.
struct DateExtensionTests {
    
    @Test func formattedForDay_today_has_correct_format() async throws {
        
        let today = Date()
        let result = today.formattedForDay()
        let formatter = DateFormatter()
        formatter.dateFormat = "d MMMM"
        let expectedSuffix = formatter.string(from: today)
        #expect(result == "Today, \(expectedSuffix)")
    }
    
    @Test func formattedForDay_date_has_correct_format() async throws {
        
        let calendar = Calendar.current
        let tomorrow = calendar.date(byAdding: .day, value: 1, to: Date())!
        let result = tomorrow.formattedForDay()
        let formatter = DateFormatter()
        formatter.dateFormat = "EEE, d MMMM"
        let expected = formatter.string(from: tomorrow)
        #expect(result == expected)
    }
}
