//
//  TimetableRepository.swift
//  MonashDashboard
//
//  Created by Brent Chionh on 1/12/2025.
//

import Foundation

protocol TimetableRepository {
    func getTimetable(limit: Int?) async throws -> [TimetableItem]
}

final class TimetableRepositoryImpl: TimetableRepository {
    
    private var timetableService: TimetableService

    init(timetableService: TimetableService) {
        self.timetableService = timetableService
    }

    func getTimetable(limit: Int?) async throws -> [TimetableItem] {
        let response = try await timetableService.getTimetable(limit: limit)
        let items = response.sessions + response.sessions
        return items.sorted(by: { $0.calendarDate < $1.calendarDate })
    }
}
