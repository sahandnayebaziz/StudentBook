//
//  String.swift
//  StudentBook
//
//  Created by Sahand Nayebaziz on 11/25/15.
//  Copyright © 2015 Sahand Nayebaziz. All rights reserved.
//

import Foundation

extension String {
    var clean: String {
        return self.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
    }
}