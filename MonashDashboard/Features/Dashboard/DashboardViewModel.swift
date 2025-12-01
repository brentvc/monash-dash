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

    var state: State
    let userRepository: UserRepository
    let timetableRepository: TimetableRepository
    
    let user: User
    var timetable: [TimetableDay] = []

    init(userRepository: UserRepository,
         timetableRepository: TimetableRepository
    ) {
        self.userRepository = userRepository
        self.timetableRepository = timetableRepository
        user = userRepository.getLoggedInUser()
        state = .idle
    }
    
    func fetchTimetable() async {
        state = .loading
        do {
            timetable = try await timetableRepository.getTimetableSummaryGroupedByDays()
            state = .loaded
        } catch {
            state = .failed(message: "Error" + error.localizedDescription)
        }
    }

    enum State {
        case idle
        case loading
        case loaded
        case failed(message: String)
    }
}
