//
//  TimetableDay.swift
//  MonashDashboard
//
//  Created by Brent Chionh on 1/12/2025.
//

import Foundation

struct TimetableDay: Sendable, Identifiable {
    var id: Date { date }
    
    let date: Date
    let items: [any TimetableItem]
}

