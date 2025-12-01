//
//  TimetableService.swift
//  MonashDashboard
//
//  Created by Brent Chionh on 1/12/2025.
//

import Foundation

protocol TimetableService {
    func getTimetable(limit: Int?) async throws -> TimetableResponse
}

enum TimetableServiceError: Error {
    case noData
}

final class TimetableServiceImpl: TimetableService {

    func getTimetable(limit: Int?) async throws -> MonashDashboard.TimetableResponse {
        guard let fileUrl = Bundle.main.url(forResource:"timetable-api", withExtension: "json") else {
            throw TimetableServiceError.noData
        }
        let data = try Data(contentsOf: fileUrl)
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        return try decoder.decode(TimetableResponse.self, from: data)
    }
}
