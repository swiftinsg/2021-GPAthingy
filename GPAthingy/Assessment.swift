//
//  Assessment.swift
//  GPAthingy
//
//  Created by cpyoufy on 15/11/21.
//

import Foundation


struct Assessment: Identifiable, Equatable, Codable {
    var id = UUID()
    
    var name: String
    var totalScore: Double
    var numberOfSubjects: Int
}
