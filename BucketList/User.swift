//
//  User.swift
//  BucketList
//
//  Created by Matthew Kruse on 10/6/24.
//

import Foundation

struct User: Identifiable, Comparable {
    let id = UUID()
    var firstName: String
    var lastName: String

    static func <(lhs: User, rhs: User) -> Bool {
        lhs.lastName < rhs.lastName
    }
}
