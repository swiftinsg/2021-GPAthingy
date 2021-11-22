//
//  AssessmentsData.swift
//  GPAthingy
//
//  Created by cpyoufy on 18/11/21.
//

import Foundation
import SwiftUI

class SubjectsData: ObservableObject {
    
    @Published var subjects: [Subject] = []
    
    let sampleSubjects = [Subject(name: "Math", score: 69, totalScore: 420, creditHours: 2),
                             Subject(name: "English", score: 42, totalScore: 50, creditHours: 3),
                          Subject(name: "Science", score: 0, totalScore: 10, creditHours: 1)]
    
    func getArchiveURL() -> URL {
        let plistName = "subjects.plist"
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        
        return documentsDirectory.appendingPathComponent(plistName)
    }
    
    func save() {
        let archiveURL = getArchiveURL()
        let propertyListEncoder = PropertyListEncoder()
        let encodedSubjects = try? propertyListEncoder.encode(subjects)
        try? encodedSubjects?.write(to: archiveURL, options: .noFileProtection)
    }
    
    func load() {
        let archiveURL = getArchiveURL()
        let propertyListDecoder = PropertyListDecoder()
        var finalSubjects: [Subject]!
        
        if let retrievedSubjectsData = try? Data(contentsOf: archiveURL),
           let decodedSubjects = try? propertyListDecoder.decode(Array<Subject>.self, from: retrievedSubjectsData) {
            finalSubjects = decodedSubjects
        } else {
            finalSubjects = sampleSubjects
        }
        
        subjects = finalSubjects
    }
}
