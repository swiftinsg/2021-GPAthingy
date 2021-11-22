//
//  AssessmentsData.swift
//  GPAthingy
//
//  Created by cpyoufy on 18/11/21.
//

import Foundation
import SwiftUI

class AssessmentsData: ObservableObject {
    
    @Published var assessments: [Assessment] = []
    
    let sampleAssessments = [Assessment (name: "Assessment 1", totalScore: 90, numberOfSubjects: 3, subjectsInAssessment: [Subject(name: "Math", score: 69, totalScore: 420, creditHours: 2, gpa: 0.0)]),
                             Assessment (name: "Assessment 2", totalScore: 80, numberOfSubjects: 4, subjectsInAssessment: [Subject(name: "Math", score: 69, totalScore: 420, creditHours: 1, gpa: 0.0)]),
                             Assessment (name: "Assessment 3", totalScore: 70, numberOfSubjects: 5, subjectsInAssessment: [Subject(name: "Math", score: 69, totalScore: 420, creditHours: 3, gpa: 0.0)])]
    func getArchiveURL() -> URL {
        let plistName = "assessments.plist"
        
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        
        return documentsDirectory.appendingPathComponent(plistName)
    }
    
    func save() {
        let archiveURL = getArchiveURL()
        let propertyListEncoder = PropertyListEncoder()
        let encodedAssessments = try? propertyListEncoder.encode(assessments)
        try? encodedAssessments?.write(to: archiveURL, options: .noFileProtection)
    }
    
    func load() {
        let archiveURL = getArchiveURL()
        let propertyListDecoder = PropertyListDecoder()
        var finalAssessments: [Assessment]!
        
        if let retrievedAssessmentsData = try? Data(contentsOf: archiveURL),
           let decodedAssessments = try? propertyListDecoder.decode(Array<Assessment>.self, from: retrievedAssessmentsData) {
            finalAssessments = decodedAssessments
        } else {
            finalAssessments = sampleAssessments
        }
        
        assessments = finalAssessments
    }
}
