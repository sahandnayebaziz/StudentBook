//
//  StudentsTableViewDataSource.swift
//  StudentBook
//
//  Created by Sahand Nayebaziz on 11/24/15.
//  Copyright © 2015 Sahand Nayebaziz. All rights reserved.
//

import Cocoa

protocol ExposedStudentDataSource {
    var data: [String] { get }
}

class StudentsTableViewDataSource: NSObject, NSTableViewDataSource, ExposedStudentDataSource {
    
    var data = ["Hello", "world", "Hello", "world", "Hello", "world", "Hello", "world", "Hello", "world", "Hello", "world"]
    
    func numberOfRowsInTableView(tableView: NSTableView) -> Int {
        return data.count
    }
    
}
