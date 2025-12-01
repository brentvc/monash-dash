//
//  TimetableItem.swift
//  MonashDashboard
//
//  Created by Brent Chionh on 1/12/2025.
//

import Foundation

protocol TimetableItem: Sendable {
    var calendarDate: Date { get }
}

struct TimetableSession: TimetableItem, Codable {
    var courseCode: String
    var title: String
    var startDate: Date
    var endDate: Date
    var location: String
    var type: SessionType
    var calendarDate: Date { return startDate }
    
    enum SessionType: String, Codable, Sendable {
        case lecture
        case tutorial
    }
}

struct TimetableTask: TimetableItem, Codable {
    var courseCode: String
    var title: String
    var dueDate: Date
    var status: TaskStatus
    var calendarDate: Date { return dueDate }
    
    enum TaskStatus: String, Codable, Sendable {
        case notSubmitted
        case submitted
    }
}
