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
    
    private func loadData() {
        let open = NSOpenPanel()
        open.canChooseDirectories = true
        open.canChooseFiles = true
        open.allowedFileTypes = ["csv", "txt"]
        let result = open.runModal()
        if (result == NSFileHandlingPanelOKButton) {
            open.close()
            if let url = open.URL {
                 if let reader = StreamReader(path: url.path!) {
                    for line in reader {
                        print(line)
                    }
                }
            }
        }
    }
    
}
