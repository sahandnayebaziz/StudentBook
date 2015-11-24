//
//  StudentsTableViewDelegate.swift
//  StudentBook
//
//  Created by Sahand Nayebaziz on 11/24/15.
//  Copyright © 2015 Sahand Nayebaziz. All rights reserved.
//

import Cocoa

class StudentsTableViewDelegate: NSObject, NSTableViewDelegate {
    
    var dataSource: ExposedStudentDataSource!
    
    func tableView(tableView: NSTableView, heightOfRow row: Int) -> CGFloat {
        return 21
    }
    
    func tableView(tableView: NSTableView, viewForTableColumn tableColumn: NSTableColumn?, row: Int) -> NSView? {
        let view = tableView.makeViewWithIdentifier("StudentsTableViewRow", owner: nil) as! StudentsTableViewRow
        view.setDetails(dataSource.data[row])
        return view
    }

}
