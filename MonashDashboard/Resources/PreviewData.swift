//
//  PreviewData.swift
//  MonashDashboard
//
//  Created by Brent Chionh on 1/12/2025.
//

import Foundation

/// Provides mock data for SwiftUI Previews
struct PreviewData {
    
    let appEnvironment = AppEnvironment()
    
    func timetableDays() -> [TimetableDay] {
        
        var days = [TimetableDay]()
        
        days.append(
            TimetableDay(
                date: Date.compose(2025, 12, 1, 0),
                items: [timetableSessions[0], timetableTasks[1]]
            )
        )
        days.append(
            TimetableDay(
                date: Date.compose(2025, 12, 3, 0),
                items: [timetableTasks[0]]
            )
        )
        
        return days
    }
    
    private var timetableSessions: [TimetableSession] {
        [
            TimetableSession(
                courseCode: "FIT2001",
                title: "Tutorial",
                startDate: Date.compose(2025, 12, 1, 10, 30),
                endDate: Date.compose(2025, 12, 1, 13, 30),
                location: "S4, 13 College Walk, Clayton",
                type: .tutorial,
                colorHex: "F57894"
            ),
            TimetableSession(
                courseCode: "FIT2050",
                title: "Lecture",
                startDate: Date.compose(2025, 12, 4, 10, 30),
                endDate: Date.compose(2025, 12, 4, 13, 30),
                location: "S4, 13 College Walk, Clayton",
                type: .lecture,
                colorHex: "F57894"
            )
        ]
    }
    
    private var timetableTasks: [TimetableTask] {
        [
            TimetableTask(
                courseCode: "FIT2050",
                title: "In-class quizzes submission closes",
                dueDate: Date.compose(2025, 12, 3, 17, 00),
                status: .notSubmitted,
                colorHex: "8673DD"
            ),
            TimetableTask(
                courseCode: "MTK1000",
                title: "Weekly Quizzes",
                dueDate: Date.compose(2025, 12, 1, 17, 00),
                status: .submitted,
                colorHex: "E2AD5E"
            )
        ]
    }
}
