//
//  TimetableItem.swift
//  MonashDashboard
//
//  Created by Brent Chionh on 1/12/2025.
//

import Foundation
import SwiftUI

protocol TimetableItem: Sendable {
    var calendarDate: Date { get }
}
