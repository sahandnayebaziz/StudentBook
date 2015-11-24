//
//  StudentsTableViewViewController.swift
//  StudentBook
//
//  Created by Sahand Nayebaziz on 11/24/15.
//  Copyright © 2015 Sahand Nayebaziz. All rights reserved.
//

import Cocoa
import SnapKit

class StudentsTableViewViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
//        view.backgroundColor = NSColor.purpleColor()
        
        let labelStudents = NSTextField()
        labelStudents.stringValue = "Students"
        labelStudents.font = NSFont.labelFontOfSize(15)
        view.addSubview(labelStudents)
        labelStudents.snp_makeConstraints { make in
            make.top.equalTo(view.snp_top).offset(10)
            make.left.equalTo(view.snp_left).offset(10)
        }
        
        for label in [labelStudents] {
            label.editable = false
            label.selectable = false
            label.bezeled = false
            label.drawsBackground = false
        }
    }
    
}
