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

    
    // MARK: - View Lifecycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        
        attachViewToAppDelegate()
        configureView()
    }
    
    func attachViewToAppDelegate() {
        (NSApplication.sharedApplication().delegate as! AppDelegate).mainVC = self
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
    }
    
    // MARK: - Receive OS X Actions -
    func receiveRequest(request: StudentBookAppRequest) {
        AppRequestDelegate.go.receiveRequest(request)
    }
    


}

