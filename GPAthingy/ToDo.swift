//
//  ToDo.swift
//  GPAthingy
//
//  Created by Yashvi Shah on 16/11/21.
//

import SwiftUI
import Foundation

enum Priority: Codable {
    case high, mid, low
}

struct ToDo: Identifiable, Equatable, Codable {
    var id = UUID()
    var title: String
    var priority: Priority
}
