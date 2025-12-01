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

        ScrollView {
            VStack {
                GreetingHeaderView(user: viewModel.user)
                    .padding(10)
                TimetableSummaryView(timetable: viewModel.timetable)
            }
            .padding(20)
        }
        .background(.black.opacity(0.1))
        .task {
            await viewModel.fetchTimetable()
        }
    }
}

#Preview {
    let env = PreviewData().appEnvironment
    DashboardView(viewModel: DashboardViewModel(userRepository: env.userRepository,
                                                timetableRepository: env.timetableRepository)
    )
}
