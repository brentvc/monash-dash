//
//  TimetableRepository.swift
//  MonashDashboard
//
//  Created by Brent Chionh on 1/12/2025.
//

import Foundation

protocol TimetableRepository {
    func getTimetableSummary() async throws -> [TimetableItem]
}

final class TimetableRepositoryImpl: TimetableRepository {
    
    private var timetableService: TimetableService

    init(timetableService: TimetableService) {
        self.timetableService = timetableService
    }

    func getTimetableSummary() async throws -> [any TimetableItem] {
        let response = try await timetableService.getTimetable()
        let items: [any TimetableItem] = response.sessions + response.tasks
        return items.sorted(by: { $0.calendarDate < $1.calendarDate })
    }
    
    func getTimetableSummaryGroupedByDays() async throws -> [TimetableDay] {

        let response = try await timetableService.getTimetable()
        let items: [any TimetableItem] = response.sessions + response.tasks

        // group flat items by day into [TimetableDay] (& sort)
        
        let calendar = Calendar.current
        let grouped = Dictionary(grouping: items) { item in
            calendar.startOfDay(for: item.calendarDate)
        }

        let sortedDays = grouped.keys.sorted()
        let timetableDays = sortedDays.map { day in
            let dayItems = (grouped[day] ?? []).sorted { $0.calendarDate < $1.calendarDate }
            return TimetableDay(
                date: day,
                items: dayItems
            )
        }
        return timetableDays
    }
}
