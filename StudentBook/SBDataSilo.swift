//
//  SBDataSilo.swift
//  StudentBook
//
//  Created by Sahand Nayebaziz on 11/24/15.
//  Copyright © 2015 Sahand Nayebaziz. All rights reserved.
//

import Foundation

class SBDataSilo: NSObject {
    
    static let get = SBDataSilo()
    
    private var data: StudentBody!
    
    var dataSaved: StudentBody {
        return data
    }
    
    func dataSaved(parsedData: StudentBody) {
        data = parsedData
    }
    

    
}
