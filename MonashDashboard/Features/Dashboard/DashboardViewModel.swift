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
    let parkingRepository: ParkingRepository
    
    let user: User
    var timetable: [TimetableDay] = []
    var carParks: [CarPark] = []

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
        state = .loading
        async let fetchTimetableTask: () = fetchTimetable()
        async let fetchParkingTask: () = fetchParking()
        _ = await (fetchTimetableTask, fetchParkingTask)
    }
    
    private func fetchTimetable() async {
        do {
            timetable = try await timetableRepository.getTimetableSummaryGroupedByDays()
        } catch {
            state = .failed(message: "Error" + error.localizedDescription)
        }
    }
    
    private func fetchParking() async {
        do {
            carParks = try await parkingRepository.getCarParks()
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
