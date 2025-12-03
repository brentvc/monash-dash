//
//  ParkingPreviewData.swift
//  MonashDashboard
//
//  Created by Brent Chionh on 3/12/2025.
//

import Foundation

/// Provides mock data for Parking SwiftUI Previews
struct ParkingPreviewData {
    
    let appEnvironment = AppEnvironment()
    
    func carParks() -> [CarPark] {
        [
            CarPark(
                name: "North (multi-level)",
                permits: [
                    ParkingPermit(name: "B", colorHex: "#4E7EFB", availableSpaces: 12),
                    ParkingPermit(name: "R", colorHex: "FC3F1F", availableSpaces: 5)
                ]
            ),
            CarPark(
                name: "West 1",
                permits: [
                    ParkingPermit(name: "B", colorHex: "#4E7EFB", availableSpaces: 0),
                    ParkingPermit(name: "R", colorHex: "FC3F1F", availableSpaces: 2)
                ]
            )
        ]
    }
}
