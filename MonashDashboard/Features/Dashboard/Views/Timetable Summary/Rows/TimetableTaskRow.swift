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
        HStack(alignment: .firstTextBaseline, spacing: 20) {
            HStack {
                TimeImageView()
                    .frame(width: 25)
                Text(task.dueTime)
                    .fontWeight(.semibold)
            }
            .frame(width: 120, alignment: .leading)
            
            VStack(alignment: .leading, spacing: 5) {
                Text(task.displayTitle)
                    .fontWeight(.semibold)
                Text(task.displayStatus)
                    .font(.subheadline)
                    .foregroundStyle(.gray)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

struct TimeImageView: View {
    
    var body: some View {
        Image(systemName: "document.fill")
            .imageScale(.small)
          .foregroundColor(.white)
          .padding(6)
          .background(.green)
          .clipShape(Circle())
    }
}
