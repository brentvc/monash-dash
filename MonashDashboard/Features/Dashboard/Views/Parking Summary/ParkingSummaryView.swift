//
//  ParkingSummaryView.swift
//  MonashDashboard
//
//  Created by Brent Chionh on 1/12/2025.
//

import SwiftUI

struct ParkingSummaryView: View {
    
    let carParks: [CarPark]
    
    var body: some View {
        VStack {
            SummaryHeaderView(title: String(localized: "Available parking spots"))
                .padding(.leading, 10)
            DashboardCardView {
                VStack(spacing: 15) {
                    ForEach(carParks) { carPark in
                        ParkingRow(carPark: carPark)
                    }
                }
            }
        }
    }
}

#Preview {
    let data = ParkingPreviewData()
    ScrollView {
        ParkingSummaryView(carParks: data.carParks())
            .padding(20)
    }
    .background(.lighterGray)
}
