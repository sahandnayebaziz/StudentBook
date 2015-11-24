//
//  MainWindowController.swift
//  StudentBook
//
//  Created by Sahand Nayebaziz on 11/24/15.
//  Copyright © 2015 Sahand Nayebaziz. All rights reserved.
//

import Cocoa

class MainWindowController: NSWindowController {
    
    let vc = MainContainerSplitViewController()

    override func windowDidLoad() {
        super.windowDidLoad()
        window?.titleVisibility = .Hidden
        window?.toolbar?.displayMode = .IconOnly
        window?.contentView = vc.view
    }
    
}