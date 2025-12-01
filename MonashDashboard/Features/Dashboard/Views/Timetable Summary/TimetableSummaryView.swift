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
        .frame(maxWidth: .infinity)
        .padding(25)
    }
}

#Preview {
    let data = PreviewData()
    NavigationStack {
        ScrollView {
            VStack {
                TimetableSummaryView(timetable: data.timetableDays())
                Spacer()
            }
            .frame(maxWidth: .infinity)
        }
        .background(.black.opacity(0.1))
    }
}

