//
//  MockTimetableService.swift
//  MonashDashboardTests
//
//  Created by Brent Chionh on 1/12/2025.
//

import Foundation
@testable import MonashDashboard

final class MockTimetableService: TimetableService {
    
    var testFileName: String = "timetable-api"
    
    func getTimetable(limit: Int?) async throws -> MonashDashboard.TimetableResponse {
        guard let fileUrl = Bundle(for: MockTimetableService.self).url(forResource:testFileName, withExtension: "json") else {
            throw TimetableServiceError.noData
        }
        let data = try Data(contentsOf: fileUrl)
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        return try decoder.decode(TimetableResponse.self, from: data)
    }
}
