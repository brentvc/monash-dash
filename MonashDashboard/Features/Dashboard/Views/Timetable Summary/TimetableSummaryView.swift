//
//  TimetableSummaryView.swift
//  MonashDashboard
//
//  Created by Brent Chionh on 1/12/2025.
//

import SwiftUI

struct TimetableSummaryView: View {
    
    var timetable: [TimetableDay]
    var body: some View {
        VStack(spacing: 10) {
            ForEach(timetable) { day in
                TimetableDayView(day: day)
            }
        }
    }
}

#Preview {
    let data = TimetablePreviewData()
    ScrollView {
        TimetableSummaryView(timetable: data.timetableDays())
            .padding(20)
    }
    .background(.lighterGray)
}

