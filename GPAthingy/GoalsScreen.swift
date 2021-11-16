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
    
    let Color_cdc1ff = Color(red: 205 / 255, green: 193 / 255, blue: 255 / 255)
    var body: some View {
        List(todo) { todo in
            VStack(alignment: .leading) {
                .foregroundColor(Color_cdc1ff)
                .cornerRadius(15)
                Text( todo.name)
                    .bold()
            }
        }
    }
}

struct GoalsScreen_Previews: PreviewProvider {
    static var previews: some View {
        GoalsScreen()
    }
}
