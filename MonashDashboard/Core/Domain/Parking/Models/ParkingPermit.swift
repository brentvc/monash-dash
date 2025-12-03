//
//  ParkingPermit.swift
//  MonashDashboard
//
//  Created by Brent Chionh on 3/12/2025.
//

import Foundation

/// Encapsulates a  Parking Permit and its' available spaces in a `CarPark`.
///
/// - Properties:
///   - id: The same value as `name`, used to conform to `Identifiable`.
///   - name: The name of the permit.
///   - colorHex: The color representing this permit
///   - availableSpaces: The number of available assigned car spaces for this permit type.
///
/// - `Sendable` - safe to pass accross concurrency bounds
///
struct ParkingPermit: Sendable, Codable, Identifiable {
    var id: String { name }
    let name: String
    let colorHex: String
    let availableSpaces: Int
    var abbreviated: String { name.first?.uppercased() ?? name }
    
    var voiceOverDescription: String {
        "Permit type: \(name), \(availableSpaces) available spaces."
    }
}
