//
//  UserRepository.swift
//  MonashDashboard
//
//  Created by Brent Chionh on 2/12/2025.
//

import Foundation

protocol UserRepository {
    func getLoggedInUser() -> User
}

final class UserRepositoryImpl: UserRepository {
    func getLoggedInUser() -> User {
        // pretend this is looking up auth'd user
        return User(firstName: "Kier", lastName: "Eagan")
    }
}
