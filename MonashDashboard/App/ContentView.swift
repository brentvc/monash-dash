//
//  ContentView.swift
//  MonashDashboard
//
//  Created by Brent Chionh on 30/11/2025.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.appEnvironment) var env
    
    var body: some View {
        NavigationStack {
            DashboardView(viewModel: DashboardViewModel(userRepository: env.userRepository,
                                                        timetableRepository: env.timetableRepository,
                                                        parkingRepository: env.parkingRepository))
        }
    }
}

#Preview {
    ContentView()
}
