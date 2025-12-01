//
//  TimetableEvent.swift
//  MonashDashboard
//
//  Created by Brent Chionh on 1/12/2025.
//

import Foundation

enum EventType: String, Codable, Sendable {
    case lecture
    case tutorial
}

struct TimetableEvent: TimetableItem, Codable {
    var courseCode: String
    var title: String
    var startDate: Date
    var endDate: Date
    var location: String
    var type: EventType
    var calendarDate: Date { return startDate }
}
