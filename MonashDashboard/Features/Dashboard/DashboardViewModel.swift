//
//  DashboardViewModel.swift
//  MonashDashboard
//
//  Created by Brent Chionh on 1/12/2025.
//

import Foundation
import Observation

@Observable
final class DashboardViewModel {
    
    enum State {
        case idle
        case loading
        case loaded
        case failed(message: String)
    }
    
    var state: State
    
    let timetableRepository: TimetableRepository
    var timetable: [TimetableDay] = []

    init(timetableRepository: TimetableRepository) {
        self.timetableRepository = timetableRepository
        state = .idle
    }
    
    func fetchTimetable() async {
        state = .loading
        do {
            timetable = try await timetableRepository.getTimetableSummaryGroupedByDays()
            state = .loaded
        } catch {
            state = .failed(message: error.localizedDescription)
        }
    }
}
