//
//  GoalsData.swift
//  GPAthingy
//
//  Created by Yashvi Shah on 20/11/21.
//

import Foundation
import SwiftUI

class TodoData: ObservableObject {
    @Published var todos: [ToDo] = []
    
    let sampleTodos = [ToDo(title: "Sample Goal", priority: .low)]
    
    func getArchiveURL() -> URL {
        let plistName = "todos.plist"
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        
        return documentsDirectory.appendingPathComponent(plistName)
    }
    
    func save() {
        let archiveURL = getArchiveURL()
        let propertyListEncoder = PropertyListEncoder()
        let encodedTodos = try? propertyListEncoder.encode(todos)
        try? encodedTodos?.write(to: archiveURL, options: .noFileProtection)
    }
    
    func load() {
        let archiveURL = getArchiveURL()
        let propertyListDecoder = PropertyListDecoder()
        
        var finalTodos: [ToDo]!
        
        if let retrievedTodoData = try? Data(contentsOf: archiveURL),
            let decodedTodos = try? propertyListDecoder.decode([ToDo].self, from: retrievedTodoData) {
            finalTodos = decodedTodos
        } else {
            finalTodos = sampleTodos
        }
        
        todos = finalTodos
    }
}
