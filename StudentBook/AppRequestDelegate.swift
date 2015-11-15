//
//  AppRequestDelegate.swift
//  StudentBook
//
//  Created by Sahand Nayebaziz on 11/15/15.
//  Copyright © 2015 Sahand Nayebaziz. All rights reserved.
//

import Foundation
import Cocoa

enum StudentBookAppRequest {
    case LoadData
}

class AppRequestDelegate: NSObject, NSOpenSavePanelDelegate  {
    
    static let go = AppRequestDelegate()
    
    func receiveRequest(request: StudentBookAppRequest) {
        switch request {
        case .LoadData:
            loadData()
        }
    }
    
    static func requestMainViewController() -> ViewController {
        return (NSApplication.sharedApplication().delegate as! AppDelegate).mainVC
    }
    
    private func loadData() {
        let open = NSOpenPanel()
        open.canChooseDirectories = true
        open.canChooseFiles = true
        open.allowedFileTypes = ["csv", "txt"]
        let result = open.runModal()
        if (result == NSFileHandlingPanelOKButton) {
            open.close()
            if let url = open.URL {
                dispatch_to_background_queue {
                    SBCSVReader.readFileAtURL(url)
                }
                // pass back the data from the url
            }
        }
    }
    
}
