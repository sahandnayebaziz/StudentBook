//
//  DarkNSWindowController.swift
//  StudentBook
//
//  Created by Sahand Nayebaziz on 11/15/15.
//  Copyright © 2015 Sahand Nayebaziz. All rights reserved.
//

import Cocoa

class DarkNSWindowController: NSWindowController {

    override func windowDidLoad() {
        super.windowDidLoad()
        
        (NSApplication.sharedApplication().delegate as! AppDelegate).window = self.window
        
        SBNotificationCenter.observeNotification(self, notification: .EndedParsing, selector: "endedParsing:")
        
        // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
        self.window?.appearance = NSAppearance(named: NSAppearanceNameVibrantLight)
        self.window?.styleMask = (self.window?.styleMask)! | NSFullSizeContentViewWindowMask
        self.window?.titlebarAppearsTransparent = true
        self.window?.movableByWindowBackground = true
        self.window?.opaque = false
    }
    
    func endedParsing(notification: NSNotificationCenter) {
        guard let activeWindow = self.window else {
            return
        }
        
        let currentFrame = activeWindow.frame
        let newFrame = NSRect(x: currentFrame.minX, y: currentFrame.minY, width: 900.0, height: 500.0)
        activeWindow.setFrame(newFrame, display: true, animate: true)
    }

}
