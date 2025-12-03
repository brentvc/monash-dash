//
//  TimetableItem.swift
//  MonashDashboard
//
//  Created by Brent Chionh on 1/12/2025.
//

import Foundation

/// A type representing a generic item that can appear on a timetable.
///
/// Conforming types must provide a `calendarDate`, which is the date used to
/// position the item within a calendar or timetable view. This allows different
/// kinds of items (e.g., sessions, tasks) to be grouped and sorted
/// consistently by a date.
///
/// Conformance:
/// - `Sendable`: Conforming types must be safe to use across concurrency domains.
///
protocol TimetableItem: Sendable {
    var calendarDate: Date { get }
}

/// A  `TimetableItem` representing a scheduled session (e.g., a lecture or tutorial) in a student's
/// academic calendar.
///
/// TimetableSession models a time-bound academic event that appears on a timetable,
/// with start / end dates and other information relevant to the course.
/// The startDate of the session is set as th `calendarDate` for sorting purposes.
/// A relevant color is also provided for displaying the time block.
///
struct TimetableSession: TimetableItem, Codable {
    var courseCode: String
    var title: String
    var startDate: Date
    var endDate: Date
    var location: String
    var type: SessionType
    var colorHex: String
    var calendarDate: Date { return startDate }
    
    var displayTitle: String { courseCode + ": " + title }
    
    var startTime: String {
        return DateFormatter.localizedString(from: startDate, dateStyle: .none, timeStyle: .short)
    }
    var endTime: String {
        return DateFormatter.localizedString(from: endDate, dateStyle: .none, timeStyle: .short)
    }
    
    var voiceoverDescription: String {
        return "Session: \(displayTitle).  From: \(startTime) to \(endTime).  Location: \(location)."
    }
    
    enum SessionType: String, Codable, Sendable {
        case lecture
        case tutorial
    }
}

/// A  `TimetableItem` representing a task (e.g., quiz/homework submission) in a student's
/// academic calendar.
///
/// TimetableTasks models an item of work that has a due date and a known status (submitted/not).
/// The dueDate of the session is set as th `calendarDate` for sorting purposes.
/// A relevant color is also provided for displaying the item state.
///
struct TimetableTask: TimetableItem, Codable {
    var courseCode: String
    var title: String
    var dueDate: Date
    var status: TaskStatus
    var colorHex: String
    var calendarDate: Date { return dueDate }
    
    var displayTitle: String { courseCode + ": " + title }
    
    var dueTime: String {
        dueDate.shortFormattedTime()
    }
    
    var displayStatus: String { status.rawValue.capitalized }
    
    enum TaskStatus: String, Codable, Sendable {
        case notSubmitted = "Not Submitted"
        case submitted = "Submitted"
    }
    
    var voiceoverDescription: String {
        return "Task: \(displayTitle).  Due: \(dueTime).  Status: \(displayStatus)."
    }
}
