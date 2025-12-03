//
//  SummaryHeaderView.swift
//  MonashDashboard
//
//  Created by Brent Chionh on 3/12/2025.
//

import SwiftUI

struct SummaryHeaderView: View {
    
    var title: String
    
    var body: some View {
        HStack {
            Text(title)
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundStyle(.darkerGray)
            Spacer()
        }
        .accessibilityLabel("Section - \(title)")
    }
}

#Preview {
    SummaryHeaderView(title: "Summary title")
        .padding()
}
