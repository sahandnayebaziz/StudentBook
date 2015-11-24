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
    
    let delegate = StudentsTableViewDelegate()
    let dataSource = StudentsTableViewDataSource()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        
        //TODO: Get rid of this min height? Somewhere in interface builder maybe?
        view.snp_makeConstraints { make in
            make.height.greaterThanOrEqualTo(250)
        }
        
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
        
        let scrollView = NSScrollView()
        view.addSubview(scrollView)
        scrollView.snp_makeConstraints { make in
            make.top.equalTo(labelStudents.snp_bottom).offset(16)
            make.bottom.equalTo(view.snp_bottom)
            make.width.equalTo(view.snp_width)
            make.centerX.equalTo(view.snp_centerX)
        }
        
        let tableView = NSTableView()
        scrollView.documentView = tableView
        scrollView.backgroundColor = NSColor.clearColor()
        scrollView.drawsBackground = false
        
        delegate.dataSource = dataSource
        tableView.setDelegate(delegate)
        tableView.setDataSource(dataSource)
        
        tableView.addTableColumn(NSTableColumn(identifier: "message"))
        tableView.tableColumns[0].headerCell.stringValue = "names"
        tableView.registerNib(NSNib(nibNamed: "StudentsTableViewRow", bundle: nil), forIdentifier: "StudentsTableViewRow")
        
        tableView.headerView = nil
        tableView.backgroundColor = NSColor.clearColor()
        
        tableView.reloadData()
    }
}
