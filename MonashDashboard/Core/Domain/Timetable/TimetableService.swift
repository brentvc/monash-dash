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

    func getTimetable() async throws -> MonashDashboard.TimetableResponse {
        // pretend this is using some API client to fetch from an api..
        guard let fileUrl = Bundle.main.url(forResource:"timetable-api", withExtension: "json") else {
            throw TimetableServiceError.noData
        }
        let data = try Data(contentsOf: fileUrl)
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        return try decoder.decode(TimetableResponse.self, from: data)
    }
}
