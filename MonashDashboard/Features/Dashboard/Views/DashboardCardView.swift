//
//  DashboardCardView.swift
//  MonashDashboard
//
//  Created by Brent Chionh on 3/12/2025.
//

import SwiftUI

struct DashboardCardView<Content: View>: View {
    
    private let content: Content
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        content
            .frame(maxWidth: .infinity)
            .padding(20)
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 20))
        
    }
}

#Preview {
    ScrollView {
        DashboardCardView {
            Text("Deserunt ea qui enim amet exercitation adipisicing laboris culpa ad elit esse minim ea. Consectetur nulla ea nulla est nulla reprehenderit cupidatat.")
        }
    }
    .padding()
    .background(.lightGray)
}
