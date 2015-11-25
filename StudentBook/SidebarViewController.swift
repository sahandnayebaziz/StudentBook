//
//  SidebarViewController.swift
//  StudentBook
//
//  Created by Sahand Nayebaziz on 11/24/15.
//  Copyright © 2015 Sahand Nayebaziz. All rights reserved.
//

import Cocoa
import SnapKit

class SidebarViewController: NSViewController {

    var tableViewViewController: StudentsTableViewViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        
        tableViewViewController = StudentsTableViewViewController()
        view.addSubview(tableViewViewController.view)
        tableViewViewController.view.snp_makeConstraints { make in
            make.top.equalTo(view.snp_top).offset(16)
            make.bottom.equalTo(view.snp_bottom)
            make.width.equalTo(view.snp_width)
            make.center.equalTo(view.snp_center)
        }

    }
    
}
