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
                TimetableSummaryView(timetable: viewModel.timetable)
                Spacer()
            }
            .frame(maxWidth: .infinity)
        }
        .background(.black.opacity(0.1))
        .task {
            await viewModel.fetchTimetable()
        }
    }
}

#Preview {
    let timetableRepository = PreviewData().appEnvironment.timetableRepository
    NavigationStack {
        DashboardView(viewModel: DashboardViewModel(timetableRepository: timetableRepository))
    }
}
