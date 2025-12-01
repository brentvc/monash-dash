//
//  PreviewData.swift
//  MonashDashboard
//
//  Created by Brent Chionh on 1/12/2025.
//

import Foundation

struct PreviewData {
    
    let appEnvironment = AppEnvironment()
    
    func timetableDays() -> [TimetableDay] {
        
        var days = [TimetableDay]()
        
        days.append(
            TimetableDay(
                date: Date.compose(2025, 12, 1, 0),
                items: [
                    TimetableSession(
                        courseCode: "FIT2001",
                        title: "Tutorial",
                        startDate: Date.compose(2025, 12, 1, 10, 30),
                        endDate: Date.compose(2025, 12, 1, 13, 30),
                        location: "S4, 13 College Walk, Clayton",
                        type: .tutorial
                    ),
                    TimetableTask(
                        courseCode: "MTK1000",
                        title: "Weekly Quizzes",
                        dueDate: Date.compose(2025, 12, 1, 17, 00),
                        status: .submitted
                    )
                ]
            )
        )
        
        days.append(
            TimetableDay(
                date: Date.compose(2025, 12, 3, 0),
                items: [
                    TimetableTask(
                        courseCode: "FIT2050",
                        title: "In-class quizzes submission closes",
                        dueDate: Date.compose(2025, 12, 3, 17, 00),
                        status: .notSubmitted
                    )
                ]
            )
        )
        
        return days
    }
    
    func timetableSession() -> TimetableSession {
        TimetableSession(
            courseCode: "FIT2001",
            title: "Tutorial",
            startDate: Date.compose(2025, 12, 1, 10, 30),
            endDate: Date.compose(2025, 12, 1, 13, 30),
            location: "S4, 13 College Walk, Clayton",
            type: .tutorial
        )
    }
    
    func timetableTask() -> TimetableTask {
        TimetableTask(
            courseCode: "FIT2050",
            title: "In-class quizzes submission closes",
            dueDate: Date.compose(2025, 12, 3, 17, 00),
            status: .notSubmitted
        )
    }
}
