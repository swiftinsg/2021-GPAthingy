//
//  GoalsScreen.swift
//  GPA
//
//  Created by Yashvi Shah on 13/11/21.
//

import SwiftUI

struct GoalsScreen: View {
    
    var todo = [ToDo(name: "Read Math Textbook"),
                   ToDo(name: "Holiday Homework"),
                   ToDo(name: "Read Up On Thesis")]
    
    var body: some View {
        List(todo) { todo in
            VStack(alignment: .leading) {
                Text( todo.name)
                    .bold()
        }
    }
}

struct GoalsScreen_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
 }
}
