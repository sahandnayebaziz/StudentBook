//
//  AppDelegate.swift
//  StudentBook
//
//  Created by Sahand Nayebaziz on 11/15/15.
//  Copyright © 2015 Sahand Nayebaziz. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    var mainVC: ViewController!
    var windows: [NSWindowController] = []

    func applicationDidFinishLaunching(aNotification: NSNotification) {
        // Insert code here to initialize your application
    }

    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
    }


    @IBAction func loadStudents(sender: AnyObject) {
        mainVC.receiveRequest(StudentBookAppRequest.LoadData)
    }
}

