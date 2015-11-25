//
//  StudentPeriodSummaryView.swift
//  StudentBook
//
//  Created by Sahand Nayebaziz on 11/25/15.
//  Copyright © 2015 Sahand Nayebaziz. All rights reserved.
//

import Cocoa

class StudentPeriodSummaryView: NSViewController {
    
    var blocks: [StudentPeriodSummaryBlock] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        for x in 0...9 {
            let block = StudentPeriodSummaryBlock()
            block.setDetails("\(x)")
            blocks.append(block)
        }
        for i in 0...blocks.count - 1 {
            let block = blocks[i]
            view.addSubview(block.view)
            
            switch i {
            case 0:
                block.view.snp_makeConstraints { make in
                    make.left.equalTo(view.snp_left)
                    make.top.equalTo(view.snp_top)
                }
            default:
                block.view.snp_makeConstraints { make in
                    make.left.equalTo(blocks[i - 1].view.snp_right).offset(2)
                    make.centerY.equalTo(blocks[i - 1].view.snp_centerY)
                }
            }
            block.view.snp_makeConstraints { make in
                make.size.equalTo(17)
            }
            block.view.alphaValue = 0.4
        }
    }
    
    func setDetails(s: Student) {
        for block in blocks {
            block.view.alphaValue = 0.3
        }
        
        for item in s.schedule {
            if 0 ... 9 ~= item.period {
                blocks[item.period].view.alphaValue = 1
            }
        }
    }
    
}
