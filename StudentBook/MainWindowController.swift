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
        window?.contentView = vc.view
        self.window?.appearance = NSAppearance(named: NSAppearanceNameVibrantLight)
        self.window?.styleMask = (self.window?.styleMask)! | NSFullSizeContentViewWindowMask
        self.window?.titlebarAppearsTransparent = true
        self.window?.movableByWindowBackground = true
    }
    
    func receiveData(data: StudentBody) {
        
    }
    
}