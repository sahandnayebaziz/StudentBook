//
//  MainViewController.swift
//  StudentBook
//
//  Created by Sahand Nayebaziz on 11/24/15.
//  Copyright © 2015 Sahand Nayebaziz. All rights reserved.
//

import Cocoa

class MainViewController: NSViewController {
    
    var headerViewController: StudentHeaderView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        view.backgroundColor = NSColor.whiteColor()
        
        headerViewController = StudentHeaderView()
        view.addSubview(headerViewController.view)
        headerViewController.view.snp_makeConstraints { make in
            make.width.equalTo(view.snp_width)
            make.top.equalTo(view.snp_top)
            make.centerX.equalTo(view.snp_centerX)
            make.height.equalTo(view.snp_height).multipliedBy(0.5)
        }
    }
    
}
