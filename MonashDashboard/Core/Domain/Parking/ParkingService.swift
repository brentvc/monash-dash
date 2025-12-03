//
//  ParkingService.swift
//  MonashDashboard
//
//  Created by Brent Chionh on 2/12/2025.
//

import Foundation

/// A service abstraction responsible for retrieving a user's parking data.
///
/// Conformance encapsulate the logic to fetch and decode parking information
/// (e.g. from a network API, json file etc).
///
/// Error handling:
/// - Implementations may throw errors related to data unavailability, transport,
///   or decoding. See concrete implementations for specific error types.
///
protocol ParkingService {

    /// Retrieves parking data from a resource (e.g network client / file).
    ///
    /// - Returns: A `ParkingResponse` representing the decoded raw parking data.
    /// - Throws:
    ///   - `ParkingServiceError.noData` if the resource cannot be located.
    ///   - `DecodingError` if the JSON structure does not match `ParkingResponse`.
    ///   - Any other `Error` thrown while retrieving the resource.
    func getParking() async throws -> ParkingResponse
}

enum ParkingServiceError: Error {
    case noData
}


/// A concrete implementation of `ParkingService` that loads parking data
/// from a bundled JSON file to simulate a network-backed API.
/// 
/// Pretend this implementation is using an API client which would call an API with
/// the relevant authentication & request parameters to identify the campus relevant for the user.
final class ParkingServiceImpl: ParkingService {

    func getParking() async throws -> ParkingResponse {
        guard let fileUrl = Bundle.main.url(forResource:"parking-api", withExtension: "json") else {
            throw ParkingServiceError.noData
        }

        let data = try Data(contentsOf: fileUrl)
        let decoder = JSONDecoder()
        return try decoder.decode(ParkingResponse.self, from: data)
    }
}
