//
//  NSLabel.swift
//  StudentBook
//
//  Created by Sahand Nayebaziz on 11/25/15.
//  Copyright © 2015 Sahand Nayebaziz. All rights reserved.
//

import Cocoa

class NSLabel: NSTextField {
    
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        editable = false
        selectable = false
        bezeled = false
        drawsBackground = false
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
