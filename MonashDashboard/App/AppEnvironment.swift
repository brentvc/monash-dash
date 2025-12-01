//
//  AppEnvironment.swift
//  MonashDashboard
//
//  Created by Brent Chionh on 1/12/2025.
//

import Foundation
import SwiftUI

struct AppEnvironment {
    
    let timetableRepository: TimetableRepository

    init() {
        let timetableService: TimetableService = TimetableServiceImpl()
        timetableRepository = TimetableRepositoryImpl(timetableService: timetableService)
    }
}

extension EnvironmentValues {
    @Entry var appEnvironment = AppEnvironment()
}
