//
//  Class.swift
//  StudentBook
//
//  Created by Sahand Nayebaziz on 11/15/15.
//  Copyright © 2015 Sahand Nayebaziz. All rights reserved.
//

import Foundation

struct ScheduleItem: Equatable {
    var name: String
    var period: Int
    var room: String
    var instructor: String
}

func ==(lhs: ScheduleItem, rhs: ScheduleItem) -> Bool {
    return lhs.period == rhs.period && lhs.name == rhs.name && lhs.room == rhs.room && lhs.instructor == rhs.instructor
}