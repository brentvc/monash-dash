//
//  TimetableService.swift
//  MonashDashboard
//
//  Created by Brent Chionh on 1/12/2025.
//

import Foundation

protocol TimetableService {
    func getTimetable() async throws -> TimetableResponse
}

enum TimetableServiceError: Error {
    case noData
}

final class TimetableServiceImpl: TimetableService {

    /// Fetches timetable data via API client.
    /// Simulated for demo purposes, reading API response from a file.
    /// - Returns: `TimetableResponse` object containing the decoded timetable data.
    /// - Throws:
    ///   - `TimetableServiceError.noData` if the bundled JSON file cannot be found.
    ///   - Any data reading or JSON decoding error
    func getTimetable() async throws -> TimetableResponse {
        guard let fileUrl = Bundle.main.url(forResource:"timetable-api", withExtension: "json") else {
            throw TimetableServiceError.noData
        }

        let data = try Data(contentsOf: fileUrl)
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        return try decoder.decode(TimetableResponse.self, from: data)
    }
}
