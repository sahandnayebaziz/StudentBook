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
        
        // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
        self.window?.appearance = NSAppearance(named: NSAppearanceNameVibrantLight)
        self.window?.styleMask = (self.window?.styleMask)! | NSFullSizeContentViewWindowMask
        self.window?.titlebarAppearsTransparent = true
        self.window?.movableByWindowBackground = true
        self.window?.opaque = false
    }

}
