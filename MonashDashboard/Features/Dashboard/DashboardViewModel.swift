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
    
    enum State {
        case inital
        case loading
        case ready
        case loadingError(message: String)
    }
    
    var state: State
    
    let timetableRepository: TimetableRepository
    var timetable: [TimetableDay] = []

    init(timetableRepository: TimetableRepository) {
        self.timetableRepository = timetableRepository
        state = .inital
    }
    
    func fetchTimetable() async {
        state = .loading
        do {
            timetable = try await timetableRepository.getTimetableSummaryGroupedByDays()
            state = .ready
        } catch {
            state = .loadingError(message: error.localizedDescription)
        }
    }
}
