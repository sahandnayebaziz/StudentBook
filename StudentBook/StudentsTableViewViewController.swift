//
//  StudentsTableViewViewController.swift
//  StudentBook
//
//  Created by Sahand Nayebaziz on 11/24/15.
//  Copyright © 2015 Sahand Nayebaziz. All rights reserved.
//

import Cocoa
import SnapKit

protocol StudentsTableViewSearchResponder {
    func searching(withQuery: String)
}

class StudentsTableViewViewController: NSViewController {
    
    var tableView: NSTableView!
    let delegate = StudentsTableViewDelegate()
    let dataSource = StudentsTableViewDataSource()
    
    var responders: [StudentsTableViewSearchResponder] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        
        //TODO: Get rid of this min height? Somewhere in interface builder maybe?
        view.snp_makeConstraints { make in
            make.height.greaterThanOrEqualTo(250)
        }
        
        let labelStudents = NSLabel()
        labelStudents.stringValue = "Students"
        labelStudents.font = NSFont.labelFontOfSize(15)
        view.addSubview(labelStudents)
        labelStudents.snp_makeConstraints { make in
            make.top.equalTo(view.snp_top).offset(10)
            make.left.equalTo(view.snp_left).offset(10)
        }
        
        let searchField = NSSearchField()
        view.addSubview(searchField)
        searchField.snp_makeConstraints { make in
            make.top.equalTo(labelStudents.snp_bottom).offset(8)
            make.width.equalTo(view.snp_width).offset(-16)
            make.centerX.equalTo(view.snp_centerX)
            make.height.equalTo(22)
        }
        
        searchField.sendsSearchStringImmediately = true
        searchField.target = self
        searchField.action = "searching:"
        
        let scrollView = NSScrollView()
        view.addSubview(scrollView)
        scrollView.snp_makeConstraints { make in
            make.top.equalTo(searchField.snp_bottom).offset(8)
            make.bottom.equalTo(view.snp_bottom)
            make.width.equalTo(view.snp_width)
            make.centerX.equalTo(view.snp_centerX)
        }
        
        tableView = NSTableView()
        scrollView.documentView = tableView
        scrollView.backgroundColor = NSColor.clearColor()
        scrollView.drawsBackground = false
        
        tableView.setDelegate(delegate)
        tableView.setDataSource(dataSource)
        delegate.tableView = tableView
        delegate.dataSource = dataSource
        responders.append(dataSource)
        
        tableView.addTableColumn(NSTableColumn(identifier: "message"))
        tableView.tableColumns[0].headerCell.stringValue = "names"
        tableView.registerNib(NSNib(nibNamed: "StudentsTableViewRow", bundle: nil), forIdentifier: "StudentsTableViewRow")
        
        tableView.headerView = nil
        tableView.backgroundColor = NSColor.clearColor()
        
        tableView.reloadData()
    }
    
    func searching(sender: NSSearchField) {
        for responder in responders {
            responder.searching(sender.stringValue)
        }
        
        tableView.reloadData()
    }
}
