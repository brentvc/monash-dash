//
//  TimetableService.swift
//  MonashDashboard
//
//  Created by Brent Chionh on 1/12/2025.
//

import Foundation

/// A service abstraction responsible for retrieving a user's timetable data.
/// 
/// Conformance encapsulate the logic to fetch and decode timetable information
/// (e.g. from a network API, json file etc).
///
/// Error handling:
/// - Implementations may throw errors related to data unavailability, transport,
///   or decoding. See concrete implementations for specific error types.
///
protocol TimetableService {

    /// Retrieves the user's timetable data from a resource (e.g network client / file).
    ///
    /// - Returns: A `TimetableResponse` representing the decoded raw timetable data.
    /// - Throws:
    ///   - `TimetableServiceError.noData` if the resource cannot be located.
    ///   - `DecodingError` if the JSON structure does not match `TimetableResponse`.
    ///   - Any other `Error` thrown while retrieving the resource.
    func getTimetable() async throws -> TimetableResponse
}

enum TimetableServiceError: Error {
    case noData
}


/// A concrete implementation of `TimetableService` that loads timetable data
/// from a bundled JSON file to simulate a network-backed API.
/// 
/// Pretend this implementation is using an API client which would call an API with
/// the relevant authentication.
final class TimetableServiceImpl: TimetableService {

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
