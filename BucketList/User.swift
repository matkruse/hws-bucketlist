//
//  User.swift
//  BucketList
//
//  Created by Matthew Kruse on 10/6/24.
//
//  Add Comparable to struct to enable sorting

import Foundation

struct User: Identifiable, Comparable {
    let id = UUID()
    var firstName: String
    var lastName: String

    // enable sorting
    static func <(lhs: User, rhs: User) -> Bool {
        lhs.lastName < rhs.lastName
    }
}
