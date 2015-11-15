//
//  Student.swift
//  StudentBook
//
//  Created by Sahand Nayebaziz on 11/15/15.
//  Copyright © 2015 Sahand Nayebaziz. All rights reserved.
//

import Foundation

struct Student: Hashable, Equatable {
    var firstName: String
    var lastName: String
    var grade: Int
    var schedule: [ScheduleItem]
    
    var hashValue: Int {
        return "\(firstName) \(lastName)".hashValue
    }
}

func ==(lhs: Student, rhs: Student) -> Bool {
    return lhs.grade == rhs.grade && lhs.firstName == rhs.firstName && lhs.lastName == rhs.lastName && lhs.schedule == rhs.schedule
}