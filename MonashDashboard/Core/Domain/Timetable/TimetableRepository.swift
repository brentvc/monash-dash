//
//  TimetableRepository.swift
//  MonashDashboard
//
//  Created by Brent Chionh on 1/12/2025.
//

import Foundation

/// Data repository for timetable data access,
/// Conformance encapsulates logic to retrieve timetable data (e.g. from an API service or
/// from cached persistence (not implemented), and transform for presentation.
///
/// Error handling:
/// - Implementations may throw if underlying data retrieval or transformation fails.
///
/// Testing:
/// - Protocol-based design facilitates dependency injection and mocking in tests.
protocol TimetableRepository {
    
    /// Retrieves a formatted summary of timetable items grouped by calendar day.
    ///
    /// The returned array sorted by ascending date, and each `TimetableDay` contains
    /// `TimetableItem`s that occur on that day, ordered by their date.
    ///
    /// - Returns: An array of `TimetableDay` groupings representing the user's timetable by day.
    /// - Throws: An error if fetching or processing the timetable data fails.
    func getTimetableSummaryGroupedByDays() async throws -> [TimetableDay]
}


/// A concrete implementation of `TimetableRepository` that retrieves timetable response data from
/// the TimetableService (API).  If we were caching the timetable data for offline display,
/// we'd implement additional logic to retrieve/cache the data (e.g. swift data / core data)
final class TimetableRepositoryImpl: TimetableRepository {
    
    private var timetableService: TimetableService

    init(timetableService: TimetableService) {
        self.timetableService = timetableService
    }
    
    /// Returns formatted timetable summary data from the TimetableService
    /// - Returns: array of `TimetableDay` data groupings
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
