//
//  TimetableRepositoryTests.swift
//  MonashDashboardTests
//
//  Created by Brent Chionh on 1/12/2025.
//

import Testing
@testable import MonashDashboard

struct TimetableRepositoryTests {

    @Test func testDataResponse() async throws {
        let mockService = MockTimetableService()
        mockService.testFileName = "timetable-api"
        let repository = TimetableRepositoryImpl(timetableService: mockService)
        let results = try await repository.getTimetable(limit: nil)
        #expect(!results.isEmpty)
    }
    
    @Test func testTEmptyDataResponse() async throws {
        let mockService = MockTimetableService()
        mockService.testFileName = "timetable-api-empty"
        let repository = TimetableRepositoryImpl(timetableService: mockService)
        let results = try await repository.getTimetable(limit: nil)
        #expect(results.isEmpty)
    }
    
    @Test func testMalformedResponseThrowsError() async throws {
        let mockService = MockTimetableService()
        mockService.testFileName = "timetable-api-malformed"
        let repository = TimetableRepositoryImpl(timetableService: mockService)
        await #expect(throws: (any Error).self) {
            try await repository.getTimetable(limit: nil)
        }
    }
}
