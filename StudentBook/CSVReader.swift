//
//  CSVReader.swift
//  StudentBook
//
//  Created by Sahand Nayebaziz on 11/15/15.
//  Copyright © 2015 Sahand Nayebaziz. All rights reserved.
//

import Foundation

struct SBCSVReader {
    
    static func readFileAtURL(url: NSURL) {
        if let reader = StreamReader(path: url.path!) {
            guard let data = createStudentBodyFromReader(reader) else {
                return
            }
            
            AppRequestDelegate.requestMainViewController().data = data
            SBNotificationCenter.postNotification(.EndedParsing)
        }
    }
    
    static func createStudentBodyFromReader(reader: StreamReader) -> StudentBody? {
        SBNotificationCenter.postNotification(.BeganParsing)
        
        var tempStudentsAndClasses: [Student: [ScheduleItem]] = [:]
        
        func clean(s: String) -> String {
            return s.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
        }
        
        var lineCount = 0
        
        for line in reader {
            
            SBNotificationCenter.postNotification(.BeganNewLine)
            
            let dataElements = line.componentsSeparatedByString(",")
            if dataElements.count >= 7 {
                let lastName = clean(dataElements[0])
                let firstName = clean(dataElements[1])
                var grade: Int
                var period: Int
                let room = clean(dataElements[4])
                let className = clean(dataElements[5])
                
                if let formattedGrade = Int(clean(dataElements[2])) {
                    grade = formattedGrade
                } else {
                    grade = 999
                }
                
                if let formattedPeriod = Int(clean(dataElements[3])) {
                    period = formattedPeriod
                } else {
                    period = 999
                }
                
                let student = Student(firstName: firstName, lastName: lastName, grade: grade, schedule: [])
                let newItem = ScheduleItem(name: className, period: period, room: room,  instructor: "")
                
                if tempStudentsAndClasses.keys.contains(student) {
                    tempStudentsAndClasses[student]!.append(newItem)
                } else {
                    tempStudentsAndClasses[student] = [newItem]
                }
            }
        }
        
        var arrayOfStudents: [Student] = []
        
        for temp in tempStudentsAndClasses.keys {
            let completedStudent = Student(firstName: temp.firstName, lastName: temp.lastName, grade: temp.grade, schedule: tempStudentsAndClasses[temp]!)
            arrayOfStudents.append(completedStudent)
        }
        
        return StudentBody(students: arrayOfStudents, dateCreated: NSDate())
    }
    
    
}