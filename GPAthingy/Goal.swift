//
//  Goal.swift
//  GPAthingy
//
//  Created by Yashvi Shah on 20/11/21.
//

import SwiftUI
import Foundation


struct Goal: Identifiable, Equatable, Codable {
    var id = UUID()
    var name: String
    var priority: Priority
}
