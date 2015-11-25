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
        
        guard withQuery.clean.componentsSeparatedByCharactersInSet(NSCharacterSet.whitespaceCharacterSet()).count != 1 else {
            data = SBDataSilo.get.dataSaved.students.filter({ $0.includesAnythingAbout(withQuery.clean)}).sort(isOrderedBefore)
            return
        }
        
        let queryComponents = withQuery.componentsSeparatedByCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
        
        data = SBDataSilo.get.dataSaved.students.filter({
            $0.includesAnythingAbout(queryComponents[0].clean) && $0.includesAnythingAbout(queryComponents[1].clean)
        }).sort(isOrderedBefore)
    }
    
}

func isOrderedBefore(one: Student, other: Student) -> Bool {
    return one.lastName < other.lastName
}