//
//  TimetableDayView.swift
//  MonashDashboard
//
//  Created by Brent Chionh on 1/12/2025.
//

import SwiftUI

struct TimetableDayView: View {
    
    var day: TimetableDay
    
    var body: some View {
        VStack(alignment: .leading, spacing: 25) {
            
            Text(day.date.formattedForDay())
                .font(.subheadline)
                .fontWeight(.bold)
            
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
        .frame(maxWidth: .infinity)
        .padding(20)
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}

#Preview {
    let data = PreviewData()
    ScrollView {
        TimetableDayView(day: data.timetableDays().first!)
            .padding()
    }
    .background(.black.opacity(0.1))
}
