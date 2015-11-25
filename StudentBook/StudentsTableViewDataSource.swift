//
//  StudentsTableViewDataSource.swift
//  StudentBook
//
//  Created by Sahand Nayebaziz on 11/24/15.
//  Copyright © 2015 Sahand Nayebaziz. All rights reserved.
//

import Cocoa

protocol ExposedStudentDataSource {
    var data: [Student] { get }
}

class StudentsTableViewDataSource: NSObject, NSTableViewDataSource, ExposedStudentDataSource {
    
    var data = SBDataSilo.get.dataSaved.students.sort(isOrderedBefore)
    
    func numberOfRowsInTableView(tableView: NSTableView) -> Int {
        return data.count
    }
    
}

func isOrderedBefore(one: Student, other: Student) -> Bool {
    return one.lastName < other.lastName
}