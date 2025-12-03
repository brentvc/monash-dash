//
//  ParkingRow.swift
//  MonashDashboard
//
//  Created by Brent Chionh on 3/12/2025.
//

import SwiftUI

struct ParkingRow: View {
    
    let carPark: CarPark
    
    var body: some View {
        HStack {
            Text(carPark.name)
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundStyle(.black)
            Spacer()
            HStack(spacing: 20) {
                ForEach(carPark.permits) { permit in
                    PermitInfoView(permit: permit)
                }
            }
        }
    }
}


#Preview {
    let data = ParkingPreviewData()
    VStack {
        ParkingRow(carPark: data.carParks()[0])
            .padding()
        ParkingRow(carPark: data.carParks()[1])
            .padding()
    }
}
