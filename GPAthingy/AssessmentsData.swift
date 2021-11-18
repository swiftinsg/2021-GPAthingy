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
    }
}
