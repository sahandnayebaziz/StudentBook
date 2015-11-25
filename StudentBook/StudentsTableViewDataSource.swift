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

class StudentsTableViewDataSource: NSObject, NSTableViewDataSource, ExposedStudentDataSource, StudentsTableViewSearchResponder {
    
    var data = SBDataSilo.get.dataSaved.students.sort(isOrderedBefore)
    var currentSearchQuery: String = ""
    
    func numberOfRowsInTableView(tableView: NSTableView) -> Int {
        return data.count
        
    }

    func searching(withQuery: String) {
        guard withQuery != "" else {
            data = SBDataSilo.get.dataSaved.students.sort(isOrderedBefore)
            return
        }
        
        data = SBDataSilo.get.dataSaved.students.filter({ $0.includesAnythingAbout(withQuery)}).sort(isOrderedBefore)
    }
    
}

func isOrderedBefore(one: Student, other: Student) -> Bool {
    return one.lastName < other.lastName
}