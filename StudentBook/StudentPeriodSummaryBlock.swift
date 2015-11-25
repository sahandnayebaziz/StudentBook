//
//  StudentPeriodSummaryBlock.swift
//  StudentBook
//
//  Created by Sahand Nayebaziz on 11/25/15.
//  Copyright © 2015 Sahand Nayebaziz. All rights reserved.
//

import Cocoa

class StudentPeriodSummaryBlock: NSViewController {
    
    var numberLabel = NSLabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        view.backgroundColor = NSColor.lightGrayColor()
        numberLabel.font = NSFont.labelFontOfSize(13)
        numberLabel.textColor = NSColor.whiteColor()
        numberLabel.alignment = .Center
        view.addSubview(numberLabel)
        numberLabel.snp_makeConstraints { make in
            make.center.equalTo(view.snp_center)
        }
        view.wantsLayer = true
        view.layer?.cornerRadius = 4
    }
    
    func setDetails(number: String) {
        numberLabel.stringValue = number
    }
    
}
