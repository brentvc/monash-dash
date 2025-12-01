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
        HStack(alignment: .firstTextBaseline, spacing: 20) {
            HStack {
                TimeCapsuleView()
                    .frame(width: 25)
                VStack(alignment: .leading) {
                    Text(session.startTime)
                        .fontWeight(.semibold)
                    Text("-" + session.endTime)
                        .font(.footnote)
                        .foregroundStyle(.gray)
                }
            }
            .frame(width: 120, alignment: .leading)
            
            VStack(alignment: .leading, spacing: 5) {
                Text(session.displayTitle)
                    .fontWeight(.semibold)
                Text(session.location)
                    .font(.subheadline)
                    .foregroundStyle(.gray)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

struct TimeCapsuleView: View {
    var body: some View {
        VStack {
            Spacer()
            Capsule()
                .foregroundStyle(.red)
                .frame(width: 8)
            Spacer()
        }
    }
}
