//
//  ParkingGarage.swift
//  MonashDashboard
//
//  Created by Brent Chionh on 3/12/2025.
//

import Foundation

/// Encapsulates a designated Car Park and its' available parking spaces for different permit types.
///
/// - Properties:
///   - id: The same value as `name`, used to conform to `Identifiable`.
///   - name: The name of the car park.
///   - permits: The list of `ParkingPermit`s.  The array may be empty if there are no permit spaces
///   available at the car park.
///
/// - `Sendable` - safe to pass accross concurrency bounds
///
struct CarPark: Sendable, Codable, Identifiable {
    var id: String { name }
    let name: String
    let permits: [ParkingPermit]
}
