//
//  TimetableRow.swift
//  MonashDashboard
//
//  Created by Brent Chionh on 2/12/2025.
//

import SwiftUI

/// Shared view for timetable sessions & tasks, with accessory construction
struct TimetableRow<Content: View>: View {

    private let title: String
    private let subtitle: String
    private let primaryDisplayTime: String
    private let secondaryDisplayTime: String?
    private let accessory: Content
    
    init (title: String,
          subtitle: String,
          primaryDisplayTime: String,
          secondaryDisplayTime: String? = nil,
          @ViewBuilder accessory: () -> Content)
    {
        self.title = title
        self.subtitle = subtitle
        self.primaryDisplayTime = primaryDisplayTime
        self.secondaryDisplayTime = secondaryDisplayTime
        self.accessory = accessory()
    }
    
    var body: some View {
        HStack(alignment: .firstTextBaseline, spacing: 15) {
            HStack {
                accessory
                    .frame(width: 25)
                VStack(alignment: .leading) {
                    Text(primaryDisplayTime)
                        .font(.subheadline)
                        .fontWeight(.semibold)
                    if let secondaryDisplayTime {
                        Text("-" + secondaryDisplayTime)
                            .font(.footnote)
                            .foregroundStyle(.gray)
                    }
                }
            }
            .frame(width: 100, alignment: .leading)
            
            VStack(alignment: .leading, spacing: 5) {
                Text(title)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                Text(subtitle)
                    .font(.footnote)
                    .foregroundStyle(.gray)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}


#Preview {
    ScrollView {
        TimetableRow(
            title: "ABC: Lecture",
            subtitle: "Computer Science",
            primaryDisplayTime: "10:00am",
            secondaryDisplayTime: "11:00am"
        ) {
            CapsuleAccessoryView()
        }
        TimetableRow(
            title: "DEF: Tutorial",
            subtitle: "Computer Science",
            primaryDisplayTime: "10:00am",
            secondaryDisplayTime: "11:00am"
        ) {
            IconAccessoryView()
        }
    }
    .padding()
}
