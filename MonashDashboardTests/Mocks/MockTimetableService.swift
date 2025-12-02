//
//  MockTimetableService.swift
//  MonashDashboardTests
//
//  Created by Brent Chionh on 1/12/2025.
//

import Foundation
@testable import MonashDashboard

/// Concrete implementation of `TimetableService` with some
/// settable properties to stub and return custom `TimetableResponse`
/// for unit testing.
final class MockTimetableService: TimetableService {
    
    /// name of the resource json file to return response data from
    var testFileName: String = "timetable-api"
    /// injected response to return
    var mockResponse: TimetableResponse?
    
    func getTimetable() async throws -> TimetableResponse {
        
        // if mock response is set, return that. otherwise return response from the
        // rererenced json file
        if let mockResponse { return mockResponse }
        
        guard let fileUrl = Bundle(for: MockTimetableService.self).url(forResource:testFileName, withExtension: "json") else {
            throw TimetableServiceError.noData
        }
        let data = try Data(contentsOf: fileUrl)
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        return try decoder.decode(TimetableResponse.self, from: data)
    }
}
