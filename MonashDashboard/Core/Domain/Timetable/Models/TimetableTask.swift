//
//  TimetableTask.swift
//  MonashDashboard
//
//  Created by Brent Chionh on 1/12/2025.
//

import Foundation

enum TaskStatus: String, Codable, Sendable {
    case notSubmitted
    case submitted
}

struct TimetableTask: TimetableItem, Codable {
    var courseCode: String
    var title: String
    var dueDate: Date
    var status: TaskStatus
    var calendarDate: Date { return dueDate }
}
