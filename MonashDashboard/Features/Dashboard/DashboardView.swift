//
//  DashboardView.swift
//  MonashDashboard
//
//  Created by Brent Chionh on 1/12/2025.
//

import SwiftUI

struct DashboardView: View {
    
    @State var viewModel: DashboardViewModel
    
    var body: some View {
        Text("Dashboard")
    }
}

#Preview {
    DashboardView(viewModel: DashboardViewModel())
}
