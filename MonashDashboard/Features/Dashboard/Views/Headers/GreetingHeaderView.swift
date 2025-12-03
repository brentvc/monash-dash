//
//  GreetingHeaderView.swift
//  MonashDashboard
//
//  Created by Brent Chionh on 2/12/2025.
//

import SwiftUI

struct GreetingHeaderView: View {
    
    var user: User
    
    var body: some View {
        HStack {
            Text("Hey, " + user.firstName)
                .font(.headline)
                .fontWeight(.heavy)
                .foregroundStyle(.black)
            Spacer()
        }
    }
}

#Preview {
    GreetingHeaderView(user: User(firstName: "Kier", lastName: "Eagan"))
        .padding()
}
