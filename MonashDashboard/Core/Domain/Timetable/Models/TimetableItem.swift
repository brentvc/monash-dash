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
    
    var displayTitle: String { courseCode + ": " + title }
    
    var startTime: String {
        return DateFormatter.localizedString(from: startDate, dateStyle: .none, timeStyle: .short)
    }
    var endTime: String {
        return DateFormatter.localizedString(from: endDate, dateStyle: .none, timeStyle: .short)
    }
    
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
    
    var displayTitle: String { courseCode + ": " + title }
    
    var dueTime: String {
        return DateFormatter.localizedString(from: dueDate, dateStyle: .none, timeStyle: .short)
    }
    
    var displayStatus: String { status.rawValue.capitalized }
    
    enum TaskStatus: String, Codable, Sendable {
        case notSubmitted = "Not Submitted"
        case submitted = "Submitted"
    }
}
