//
//  Assessment.swift
//  GPAthingy
//
//  Created by cpyoufy on 15/11/21.
//

import Foundation


struct Subject: Identifiable, Equatable, Codable {
    var id = UUID()
    
    var name: String
    var score: Double
    var totalScore: Double
    var creditHours: Double
    var gpa: Double
}
