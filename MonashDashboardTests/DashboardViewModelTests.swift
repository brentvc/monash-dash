//
//  DashboardViewModelTests.swift
//  MonashDashboardTests
//
//  Created by Brent Chionh on 3/12/2025.
//

import Foundation
import Testing
@testable import MonashDashboard

/// Tests the Dashboard view model states.
struct DashboardViewModelTests {
    
    @Test func correct_states_when_fetching_data() async throws {
        
        let userRepository: UserRepository = UserRepositoryImpl()
        
        let mockParkingService = MockParkingService()
        mockParkingService.testFileName = "parking-api"
        let parkingRepository = ParkingRepositoryImpl(parkingService: mockParkingService)
        
        let mockTimetableService = MockTimetableService()
        mockTimetableService.testFileName = "timetable-api"
        let timetableRepository = TimetableRepositoryImpl(timetableService: mockTimetableService)
        
        
        let viewModel = DashboardViewModel(
            userRepository: userRepository,
            timetableRepository: timetableRepository,
            parkingRepository: parkingRepository
        )

        #expect(viewModel.state == .idle)

        let task = Task {
            await viewModel.fetchData()
        }
        await Task.yield()
        #expect(viewModel.state == .loading)
        await task.value
        #expect(viewModel.state == .loaded)
        #expect(viewModel.alertMessage == nil)
        #expect(!viewModel.carParks.isEmpty)
        #expect(!viewModel.timetable.isEmpty)
    }
    
    @Test func correct_states_when_fetch_error_encountered() async throws {
        
        let userRepository: UserRepository = UserRepositoryImpl()
        
        let mockParkingService = MockParkingService()
        mockParkingService.testFileName = "bad-data"
        let parkingRepository = ParkingRepositoryImpl(parkingService: mockParkingService)
        
        let mockTimetableService = MockTimetableService()
        mockTimetableService.testFileName = "bad-data"
        let timetableRepository = TimetableRepositoryImpl(timetableService: mockTimetableService)
        
        
        let viewModel = DashboardViewModel(
            userRepository: userRepository,
            timetableRepository: timetableRepository,
            parkingRepository: parkingRepository
        )

        #expect(viewModel.state == .idle)

        let task = Task {
            await viewModel.fetchData()
        }
        await Task.yield()
        #expect(viewModel.state == .loading)
        await task.value
        #expect(viewModel.state == .loaded)
        #expect(viewModel.alertMessage != nil)
        #expect(viewModel.carParks.isEmpty)
        #expect(viewModel.timetable.isEmpty)
    }
}
