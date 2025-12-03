//
//  TimetableDayView.swift
//  MonashDashboard
//
//  Created by Brent Chionh on 1/12/2025.
//

import SwiftUI

/// Shared view for timetable sessions & tasks, with accessory construction
struct TimetableDayView: View {
    
    var day: TimetableDay
    
    var body: some View {
        DashboardCardView {
            VStack(alignment: .leading, spacing: 25) {
                
                Text(day.date.formattedForDay())
                    .font(.subheadline)
                    .fontWeight(.bold)
                    .foregroundStyle(.black)
                    .accessibilityLabel(day.voiceoverDescription)
                
                VStack(alignment: .leading, spacing: 20) {
                    ForEach(day.items.indices, id: \.self) { index in
                        let item = day.items[index]
                        
                        if let session = item as? TimetableSession {
                            TimetableSessionRow(session: session)
                        } else if let task = item as? TimetableTask {
                            TimetableTaskRow(task: task)
                        }
                        
                        if index != day.items.count - 1 {
                            Divider()
                                .padding(.trailing, -25)
                        }
                    }
                }
                .frame(maxWidth: .infinity)
            }
        }
    }
}

#Preview {
    let data = TimetablePreviewData()
    ScrollView {
        TimetableDayView(day: data.timetableDays().first!)
            .padding()
    }
    .background(.lighterGray)
}
