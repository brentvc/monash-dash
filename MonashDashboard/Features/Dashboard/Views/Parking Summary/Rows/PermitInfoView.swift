//
//  PermitInfoView.swift
//  MonashDashboard
//
//  Created by Brent Chionh on 3/12/2025.
//

import SwiftUI

struct PermitInfoView: View {
    
    let permit: ParkingPermit
    
    var body: some View {
        HStack(spacing:5) {
            Text(permit.name)
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundStyle(.white)
                .padding(8)
                .background(
                    Circle()
                        .fill(Color(hex: permit.colorHex))
                )
            Text("\(permit.availableSpaces)")
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundStyle(.black)
                .frame(minWidth: 20, alignment: .leading)
        }
    }
}
