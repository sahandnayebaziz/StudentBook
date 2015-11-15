//
//  ViewController.swift
//  StudentBook
//
//  Created by Sahand Nayebaziz on 11/15/15.
//  Copyright © 2015 Sahand Nayebaziz. All rights reserved.
//

import Cocoa
import SnapKit

class ViewController: NSViewController {

    // MARK: - Properties -
    var data: StudentBody? = nil {
        didSet {
            dispatch_to_main_queue {
                for sub in self.view.subviews {
                    sub.removeFromSuperview()
                }
                
                let label = NSTextField()
                label.editable = false
                label.font = NSFont.systemFontOfSize(24, weight: 0.0)
                label.alignment = .Center
                label.textColor = NSColor.secondaryLabelColor()
                label.backgroundColor = NSColor.clearColor()
                label.bezeled = false
                label.selectable = false
                label.drawsBackground = false
                label.stringValue = "Done!"
                self.view.addSubview(label)
                label.snp_makeConstraints { make in
                    make.centerX.equalTo(self.view.snp_centerX)
                    make.centerY.equalTo(self.view.snp_centerY).offset(-22)
                    make.width.equalTo(self.view.snp_width)
                }
            }
        }
    }
    
    var progress: NSProgressIndicator? = nil
    
    // MARK: - View Lifecycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        
        attachViewToAppDelegate()
        addNotificationObservers()
        configureView()
    }
    
    func attachViewToAppDelegate() {
        (NSApplication.sharedApplication().delegate as! AppDelegate).mainVC = self
    }
    
    func addNotificationObservers() {
        SBNotificationCenter.observeNotification(self, notification: SBNotification.BeganParsing, selector: "beganParsing:")
        SBNotificationCenter.observeNotification(self, notification: SBNotification.BeganNewLine, selector: "beganNewLine:")
    }
    
    func configureView() {
        let blurView = NSVisualEffectView()
        blurView.material = .Dark
        blurView.blendingMode = .BehindWindow
        view.addSubview(blurView, positioned: .Below, relativeTo: nil)
        view.snp_makeConstraints { make in
            make.size.equalTo(view.snp_size)
            make.center.equalTo(view.snp_center)
        }
        
        let label = NSTextField()
        label.editable = false
        label.font = NSFont.systemFontOfSize(24, weight: 0.0)
        label.alignment = .Center
        label.textColor = NSColor.secondaryLabelColor()
        label.backgroundColor = NSColor.clearColor()
        label.bezeled = false
        label.selectable = false
        label.drawsBackground = false
        label.stringValue = "Press Command + O to open a file"
        view.addSubview(label)
        label.snp_makeConstraints { make in
            make.center.equalTo(view.snp_center)
            make.width.equalTo(view.snp_width)
        }
    }
    
    // MARK: - Receive OS X Actions -
    func receiveRequest(request: StudentBookAppRequest) {
        AppRequestDelegate.go.receiveRequest(request)
    }
    
    func beganNewLine(notification: NSNotification) {
        guard let indicator = self.progress else {
            return
        }
        indicator.incrementBy(1.0)
    }
    
    func beganParsing(notification: NSNotification) {
        print("received notification")
        print("running begin parsing")
        
        for sub in view.subviews {
            sub.removeFromSuperview()
        }
        
        let label = NSTextField()
        label.editable = false
        label.font = NSFont.systemFontOfSize(24, weight: 0.0)
        label.alignment = .Center
        label.textColor = NSColor.secondaryLabelColor()
        label.backgroundColor = NSColor.clearColor()
        label.bezeled = false
        label.selectable = false
        label.drawsBackground = false
        label.stringValue = "Loading student information..."
        view.addSubview(label)
        label.snp_makeConstraints { make in
            make.centerX.equalTo(view.snp_centerX)
            make.centerY.equalTo(view.snp_centerY).offset(-22)
            make.width.equalTo(view.snp_width)
        }
        
        progress = NSProgressIndicator()
        progress!.indeterminate = false
        progress!.minValue = 0
        progress!.maxValue = 16414
        progress!.style = .BarStyle
        view.addSubview(progress!)
        progress!.snp_makeConstraints { make in
            make.width.equalTo(view.snp_width).offset(-88)
            make.centerX.equalTo(view.snp_centerX)
            make.top.equalTo(label.snp_bottom).offset(44)
        }
        progress!.startAnimation(nil)
    }
    


}

