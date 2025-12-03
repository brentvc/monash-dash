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
                    .frame(maxWidth: 25)
                VStack(alignment: .leading) {
                    Text(primaryDisplayTime)
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundStyle(.black)
                    if let secondaryDisplayTime {
                        Text("-" + secondaryDisplayTime)
                            .font(.footnote)
                            .foregroundStyle(.darkerGray)
                    }
                }
            }
            .frame(maxWidth: 100, alignment: .leading)
            
            VStack(alignment: .leading, spacing: 5) {
                Text(title)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundStyle(.black)
                Text(subtitle)
                    .font(.footnote)
                    .foregroundStyle(.darkerGray)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}


#Preview {
    ScrollView {
        VStack(spacing: 30) {
            TimetableRow(
                title: "Session Title",
                subtitle: "Session Subtitle",
                primaryDisplayTime: "10:00am",
                secondaryDisplayTime: "11:00am"
            ) {
                CapsuleAccessoryView(color: .green)
            }

            TimetableRow(
                title: "Task Title",
                subtitle: "Task Subtitle",
                primaryDisplayTime: "10:00am",
                secondaryDisplayTime: nil
            ) {
                IconAccessoryView(color: .blue)
            }
            
            TimetableRow(
                title: "minim dolor eu est occaecat nulla aute excepteur in incididunt",
                subtitle: "minim dolor eu est occaecat nulla aute excepteur in incididunt",
                primaryDisplayTime: "10:00am",
                secondaryDisplayTime: nil
            ) {
                IconAccessoryView(color: .purple)
            }
        }
    }
    .padding(20)
}
