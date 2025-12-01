//
//  IconAccessoryView.swift
//  MonashDashboard
//
//  Created by Brent Chionh on 2/12/2025.
//

import SwiftUI

struct IconAccessoryView: View {
    
    let color: Color = .green
    let symbolName: String = "document.fill"
    
    var body: some View {
        Image(systemName: symbolName)
            .imageScale(.small)
          .foregroundColor(.white)
          .padding(6)
          .background(color)
          .clipShape(Circle())
    }
}
