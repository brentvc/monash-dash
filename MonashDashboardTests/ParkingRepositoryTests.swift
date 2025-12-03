//
//  ParkingRepositoryTests.swift
//  MonashDashboardTests
//
//  Created by Brent Chionh on 3/12/2025.
//

import Foundation
import Testing
@testable import MonashDashboard

/// Tests the `ParkingRepository` which manages parking data access.
/// The `ParkingService` dependency is mocked to return test data.
struct ParkingRepositoryTests {
    
    @Test func valid_car_parks_data_returned() async throws {
        let mockService = MockParkingService()
        mockService.testFileName = "parking-api"
        let repository = ParkingRepositoryImpl(parkingService: mockService)
        let carParks = try await repository.getCarParks()
        #expect(carParks.count == 3)
        let carPark1 = carParks[0]
        let carPark2 = carParks[1]
        let carPark3 = carParks[2]
        #expect(carPark1.name == "North (multi-level)")
        #expect(carPark2.name == "West 1")
        #expect(carPark3.name == "West 2")
        #expect(carPark1.permits.count == 2)
        #expect(carPark2.permits.count == 2)
        #expect(carPark3.permits.count == 0)
    }
    
    @Test func empty_parking_response_if_service_data_is_empty() async throws {
        let mockService = MockParkingService()
        mockService.testFileName = "parking-api-empty"
        let repository = ParkingRepositoryImpl(parkingService: mockService)
        let carParks = try await repository.getCarParks()
        #expect(carParks.isEmpty)
    }
    
    @Test func error_thrown_if_service_data_is_malformed() async throws {
        let mockService = MockParkingService()
        mockService.testFileName = "api-malformed"
        let repository = ParkingRepositoryImpl(parkingService: mockService)
        await #expect(throws: (any Error).self) {
            try await repository.getCarParks()
        }
    }
    
    @Test func error_thrown_if_service_data_not_found() async throws {
        let mockService = MockParkingService()
        mockService.testFileName = "doesnt-exist"
        let repository = ParkingRepositoryImpl(parkingService: mockService)
        await #expect(throws: (ParkingServiceError.noData).self) {
            try await repository.getCarParks()
        }
    }
}
