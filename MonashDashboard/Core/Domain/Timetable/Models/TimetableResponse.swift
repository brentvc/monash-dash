//
//  TimetableResponse.swift
//  MonashDashboard
//
//  Created by Brent Chionh on 1/12/2025.
//

import Foundation

struct TimetableResponse: Codable {
    var sessions: [TimetableEvent]
    var tasks: [TimetableTask]
}
