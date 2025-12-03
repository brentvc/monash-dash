//
//  ParkingRepository.swift
//  MonashDashboard
//
//  Created by Brent Chionh on 2/12/2025.
//

import Foundation

/// Data repository for parking data access,
/// Conformance encapsulates logic to retrieve parking data (e.g. from an API service or
/// from cached persistence (not implemented), and transform for presentation.
///
/// Error handling:
/// - Implementations may throw if underlying data retrieval or transformation fails.
///
protocol ParkingRepository {

    /// Retrieves a list of car parks with permit space availability.
    ///
    ///
    /// - Returns: An array of `CarPark` items representing parking lots and their permit space availability.
    /// - Throws: An error if fetching or processing the parking data fails.
    func getCarParks() async throws -> [CarPark]
}

/// A concrete implementation of `ParkingRepository` that retrieves parking response data from
/// the ParkingService (API).  It's assumed parking data has a live requirement so no caching is expected.
final class ParkingRepositoryImpl: ParkingRepository {
    
    private var parkingService: ParkingService

    init(parkingService: ParkingService) {
        self.parkingService = parkingService
    }
    
    func getCarParks() async throws -> [CarPark] {
        return try await parkingService.getParking().carParks
    }
}
