//
//  StudentHeaderView.swift
//  StudentBook
//
//  Created by Sahand Nayebaziz on 11/25/15.
//  Copyright © 2015 Sahand Nayebaziz. All rights reserved.
//

import Cocoa
import SnapKit

class StudentHeaderView: NSViewController {
    
    var name: NSLabel!
    var grade: NSLabel!
    var periodSummary: StudentPeriodSummaryView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        SBNotificationCenter.observeDataNotification(self, notification: SBDataNotification.SelectedStudent, selector: "selectedStudent:")
        
        name = NSLabel()
        name.stringValue = ""
        name.font = NSFont.labelFontOfSize(18)
        view.addSubview(name)
        name.snp_makeConstraints { make in
            make.top.equalTo(view.snp_top).offset(24)
            make.left.equalTo(view.snp_left).offset(20)
        }
        
        grade = NSLabel()
        grade.stringValue = ""
        grade.font = NSFont.labelFontOfSize(18)
        grade.textColor = NSColor.grayColor()
        view.addSubview(grade)
        grade.snp_makeConstraints { make in
            make.centerY.equalTo(name.snp_centerY)
            make.left.equalTo(name.snp_right).offset(10)
        }
        
        periodSummary = StudentPeriodSummaryView()
        view.addSubview(periodSummary.view)
        periodSummary.view.snp_makeConstraints { make in
            make.left.equalTo(name.snp_left)
            make.top.equalTo(name.snp_bottom).offset(12)
            make.height.greaterThanOrEqualTo(17)
            make.width.equalTo(view.snp_width)
        }
    }
    
    func setDetails(s: Student) {
        name.stringValue = "\(s.lastName), \(s.firstName)"
        grade.stringValue = "\(s.grade)th"
        periodSummary.setDetails(s)
    }
    
    func selectedStudent(notification: NSNotification) {
        guard let data = notification.userInfo else {
            return
        }
        
        guard let wrapper = data["student"]! as? SBWrapper<Student> else {
            return
        }
        
        setDetails(wrapper.value)
    }
    
}
