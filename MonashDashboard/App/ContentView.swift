//
//  ContentView.swift
//  MonashDashboard
//
//  Created by Brent Chionh on 30/11/2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            DashboardView(viewModel: DashboardViewModel())
        }
    }
}

#Preview {
    ContentView()
}
