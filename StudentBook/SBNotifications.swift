//
//  SBNotifications.swift
//  StudentBook
//
//  Created by Sahand Nayebaziz on 11/15/15.
//  Copyright © 2015 Sahand Nayebaziz. All rights reserved.
//

import Foundation

enum SBNotification: String {
    case
    BeganParsing,
    EndedParsing,
    BeganNewLine,
    DeterminedLineCount
}

struct SBNotificationCenter {
    
    static func observeNotification(observer: NSObject, notification: SBNotification, selector: Selector) {
        NSNotificationCenter.defaultCenter().addObserver(observer, selector: selector, name: notification.rawValue, object: nil)
    }
    
    static func postNotification(notification: SBNotification) {
        dispatch_to_main_queue {
            NSNotificationCenter.defaultCenter().postNotificationName(notification.rawValue, object: nil)
        }
    }
    
}