//
//  TimetableResponse.swift
//  MonashDashboard
//
//  Created by Brent Chionh on 1/12/2025.
//

import Foundation

/// A type representing the mapped, decoded response from the Timetable API..
///
/// Holds the session and task items decoded from the response which can then
/// be processed further.
struct TimetableResponse: Sendable, Codable {
    var sessions: [TimetableSession]
    var tasks: [TimetableTask]
}
