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

    private let userRepository: UserRepository
    private let timetableRepository: TimetableRepository
    private let parkingRepository: ParkingRepository

    private(set) var state: State
    private(set) var user: User
    private(set) var timetable: [TimetableDay] = []
    private(set) var carParks: [CarPark] = []
    private(set) var alertMessage: String?

    init(userRepository: UserRepository,
         timetableRepository: TimetableRepository,
         parkingRepository: ParkingRepository
    ) {
        self.userRepository = userRepository
        self.timetableRepository = timetableRepository
        self.parkingRepository = parkingRepository
        user = userRepository.getLoggedInUser()
        state = .idle
    }

    func fetchData() async {
        alertMessage = nil
        state = .loading
        async let fetchTimetableTask: () = fetchTimetable()
        async let fetchParkingTask: () = fetchParking()
        _ = await (fetchTimetableTask, fetchParkingTask)
        state = .loaded
    }
    
    private func fetchTimetable() async {
        do {
            timetable = try await timetableRepository.getTimetableSummaryGroupedByDays()
        } catch {
            alertMessage = "Fetch issue: " + error.localizedDescription
        }
    }
    
    private func fetchParking() async {
        do {
            carParks = try await parkingRepository.getCarParks()
        } catch {
            alertMessage = "Fetch issue:" + error.localizedDescription
        }
    }

    enum State {
        case idle
        case loading
        case loaded
    }
}
