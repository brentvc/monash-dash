//
//  TimetableDay.swift
//  MonashDashboard
//
//  Created by Brent Chionh on 1/12/2025.
//

import Foundation

/// Encapsulates a day of grouped `TimetableItem`s (i.e. all occurring on the
/// same day).
///
/// - Properties:
///   - id: The same value as `date`, used to conform to `Identifiable`.
///   - date: The `Date` representing the day for which the items are grouped.
///   - items: The collection of timetable items (`any TimetableItem`) scheduled
///     for the given `date`. The array may be empty if there are no entries.
///
/// - `Sendable` - safe to pass accross concurrency bounds
///
struct TimetableDay: Sendable, Identifiable {
    var id: Date { date }
    let date: Date
    let items: [any TimetableItem]
}

