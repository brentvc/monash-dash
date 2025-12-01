//
//  TimetableSessionRow.swift
//  MonashDashboard
//
//  Created by Brent Chionh on 1/12/2025.
//

import SwiftUI

struct TimetableSessionRow: View {
    
    var session: TimetableSession
    
    var body: some View {
        TimetableRow(
            title: session.displayTitle,
            subtitle: session.location,
            primaryDisplayTime: session.startTime,
            secondaryDisplayTime: session.endTime,
            accessory: {
                CapsuleAccessoryView()
            }
        )
    }
}
