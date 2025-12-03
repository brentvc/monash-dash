//
//  ParkingResponse.swift
//  MonashDashboard
//
//  Created by Brent Chionh on 3/12/2025.
//

import Foundation

/// A type representing the mapped, decoded response from the Parking API..
///
/// Holds the `CarPark` items decoded from the response which can then
/// be processed further.
struct ParkingResponse: Sendable, Codable {
    var carParks: [CarPark]
}
