//
//  Assessment.swift
//  GPAthingy
//
//  Created by cpyoufy on 15/11/21.
//

import Foundation


struct Subject: Identifiable, Equatable {
    var id = UUID()
    
    var name: String
    var score: Double
}
