//
//  CapsuleAccessoryView.swift
//  MonashDashboard
//
//  Created by Brent Chionh on 2/12/2025.
//

import SwiftUI

struct CapsuleAccessoryView: View {
    
    let color: Color = .red
    
    var body: some View {
        Capsule()
            .foregroundStyle(color)
            .frame(width: 8)
    }
}

