//
//  TimetableTaskRow.swift
//  MonashDashboard
//
//  Created by Brent Chionh on 1/12/2025.
//

import SwiftUI

struct TimetableTaskRow: View {
    
    var task: TimetableTask
    
    var body: some View {
        TimetableRow(
            title: task.displayTitle,
            subtitle: task.displayStatus,
            primaryDisplayTime: task.dueTime,
            secondaryDisplayTime: nil,
            accessory: {
                IconAccessoryView(color: Color(hex: task.colorHex))
            }
        )
        .accessibilityElement(children: .combine)
        .accessibilityLabel(task.voiceoverDescription)
    }
}
