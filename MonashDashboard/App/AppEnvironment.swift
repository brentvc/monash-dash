//
//  AppEnvironment.swift
//  MonashDashboard
//
//  Created by Brent Chionh on 1/12/2025.
//

import Foundation
import SwiftUI

/// Resolved app dependencies - passed down through the environment
struct AppEnvironment {
    
    let timetableRepository: TimetableRepository
    let userRepository: UserRepository

    init() {
        let timetableService: TimetableService = TimetableServiceImpl()
        timetableRepository = TimetableRepositoryImpl(timetableService: timetableService)
        userRepository = UserRepositoryImpl()
    }
}

extension EnvironmentValues {
    @Entry var appEnvironment = AppEnvironment()
}
