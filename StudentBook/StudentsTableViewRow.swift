//
//  StudentsTableViewRow.swift
//  StudentBook
//
//  Created by Sahand Nayebaziz on 11/24/15.
//  Copyright © 2015 Sahand Nayebaziz. All rights reserved.
//

import Cocoa

class StudentsTableViewRow: NSView {

    @IBOutlet weak var nameField: NSTextField!
    
    func setDetails(name: String) {
        nameField.stringValue = name
    }
    
}
