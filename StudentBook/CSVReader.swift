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
            
            SBDataSilo.get.dataSaved(data)
            SBNotificationCenter.postNotification(.EndedParsing)
        }
    }
    
    static func createStudentBodyFromReader(reader: StreamReader) -> StudentBody? {
        SBNotificationCenter.postNotification(.BeganParsing)
        
        var tempStudentsAndClasses: [Student: [ScheduleItem]] = [:]
        
        for line in reader {
            
            SBNotificationCenter.postNotification(.BeganNewLine)
            
            let dataElements = line.componentsSeparatedByString(",")
            if dataElements.count >= 7 {
                let lastName = dataElements[0].clean
                let firstName = dataElements[1].clean
                var grade: Int
                var period: Int
                let room = dataElements[4].clean
                let className = dataElements[5].clean
                let instructor = dataElements[6].clean
                
                if let formattedGrade = Int(dataElements[2].clean) {
                    grade = formattedGrade
                } else {
                    grade = 999
                }
                
                if let formattedPeriod = Int(dataElements[3].clean) {
                    period = formattedPeriod
                } else {
                    period = 999
                }
                
                let student = Student(firstName: firstName, lastName: lastName, grade: grade, schedule: [])
                let newItem = ScheduleItem(name: className, period: period, room: room,  instructor: instructor)

                if tempStudentsAndClasses.keys.contains(student) {
                    tempStudentsAndClasses[student]!.append(newItem)
                } else {
                    tempStudentsAndClasses[student] = [newItem]
                }
            }
        }
        
        var arrayOfStudents: [Student] = []
        
        for sKey in tempStudentsAndClasses.keys {
            let completedStudent = Student(firstName: sKey.firstName, lastName: sKey.lastName, grade: sKey.grade, schedule: tempStudentsAndClasses[sKey]!)
            arrayOfStudents.append(completedStudent)
        }
        
        return StudentBody(students: arrayOfStudents, dateCreated: NSDate())
    }
    
    
}