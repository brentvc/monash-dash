//
//  TimetableRepositoryTests.swift
//  MonashDashboardTests
//
//  Created by Brent Chionh on 1/12/2025.
//

import Foundation
import Testing
@testable import MonashDashboard

struct TimetableRepositoryTests {

    @Test func valid_timetable_summary_returned() async throws {
        let mockService = MockTimetableService()
        mockService.testFileName = "timetable-api"
        let repository = TimetableRepositoryImpl(timetableService: mockService)
        let days = try await repository.getTimetableSummaryGroupedByDays()
        #expect(days.count == 3)
        #expect(days[0].items.count == 2)
        #expect(days[1].items.count == 1)
        #expect(days[2].items.count == 1)
    }

    @Test func timetable_summary_is_sorted() async throws {

        // given
        let mockService = MockTimetableService()
        let mockResponse = TimetableResponse(
            sessions: [
                TimetableSession(courseCode: "abc",
                                 title: "Lecture",
                                 startDate: Date.compose(2025, 12, 2, 14, 30),
                                 endDate: Date.compose(2025, 12,2, 15, 30),
                                 location: "A",
                                 type: .lecture)
                ,
                TimetableSession(courseCode: "abc",
                                 title: "Tutorial",
                                 startDate: Date.compose(2025, 12, 1, 9, 30),
                                 endDate: Date.compose(2025, 12, 1, 11, 30),
                                 location: "A",
                                 type: .tutorial
                                )
            ],
            tasks: [
                TimetableTask(courseCode: "def",
                              title: "Quiz",
                              dueDate: Date.compose(2025, 11, 30, 20, 0),
                              status: .submitted
                             )
            ]
        )
        mockService.mockResponse = mockResponse
        let repository = TimetableRepositoryImpl(timetableService: mockService)

        // when
        let days = try await repository.getTimetableSummaryGroupedByDays()
        
        // then
        let expected = days.sorted(by: { $0.date < $1.date })
        #expect(days.map(\.date) == expected.map(\.date), "timetable days should be sorted by date")
        
        for day in days {
            let expected = day.items.sorted(by: { $0.calendarDate < $1.calendarDate })
            #expect(day.items.map(\.calendarDate) == expected.map(\.calendarDate), "timetable day items should be sorted by date")
        }
    }

    @Test func empty_timetable_response_if_service_data_is_empty() async throws {
        let mockService = MockTimetableService()
        mockService.testFileName = "timetable-api-empty"
        let repository = TimetableRepositoryImpl(timetableService: mockService)
        let results = try await repository.getTimetableSummaryGroupedByDays()
        #expect(results.isEmpty)
    }
    
    @Test func error_thrown_if_service_data_is_malformed() async throws {
        let mockService = MockTimetableService()
        mockService.testFileName = "timetable-api-malformed"
        let repository = TimetableRepositoryImpl(timetableService: mockService)
        await #expect(throws: (any Error).self) {
            try await repository.getTimetableSummaryGroupedByDays()
        }
    }
    
    @Test func error_thrown_if_service_data_not_found() async throws {
        let mockService = MockTimetableService()
        mockService.testFileName = "doesnt-exist"
        let repository = TimetableRepositoryImpl(timetableService: mockService)
        await #expect(throws: (TimetableServiceError.noData).self) {
            try await repository.getTimetableSummaryGroupedByDays()
        }
    }
}
