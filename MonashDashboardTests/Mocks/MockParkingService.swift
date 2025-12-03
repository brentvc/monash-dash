//
//  MockParkingService.swift
//  MonashDashboardTests
//
//  Created by Brent Chionh on 3/12/2025.
//

import Foundation
@testable import MonashDashboard

/// Concrete implementation of `ParkingService` with some
/// settable properties to stub and return custom `ParkingResponse`
/// for unit testing.
final class MockParkingService: ParkingService {
    
    /// name of the resource json file to return response data from
    var testFileName: String = "parking-api"
    /// injected response to return
    var mockResponse: ParkingResponse?
    
    func getParking() async throws -> ParkingResponse {
        
        // if mock response is set, return that. otherwise return response from the
        // rererenced json file
        if let mockResponse { return mockResponse }
        
        guard let fileUrl = Bundle(for: MockParkingService.self).url(forResource:testFileName, withExtension: "json") else {
            throw ParkingServiceError.noData
        }
        let data = try Data(contentsOf: fileUrl)
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        return try decoder.decode(ParkingResponse.self, from: data)
    }
}
