//
//  DashboardViewModel.swift
//  MonashDashboard
//
//  Created by Brent Chionh on 1/12/2025.
//

import Foundation
import Observation

@Observable
class DashboardViewModel {
    
    let timetableRepository: TimetableRepository
    var timetable: [TimetableDay] = []

    init(timetableRepository: TimetableRepository) {
        self.timetableRepository = timetableRepository
    }
}
