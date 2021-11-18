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
    
}
