//
//  TimetableDay.swift
//  MonashDashboard
//
//  Created by Brent Chionh on 1/12/2025.
//

import Foundation

struct TimetableDay: Sendable {
    let date: Date
    let items: [any TimetableItem]
}
