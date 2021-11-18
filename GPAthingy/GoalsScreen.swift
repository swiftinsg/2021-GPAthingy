//
//  GoalsScreen.swift
//  GPA
//
//  Created by Yashvi Shah on 13/11/21.
//

import SwiftUI

struct GoalsScreen: View {
    
    let listItemColor = Color(red: 245 / 255, green: 239 / 255, blue: 255 / 255)
    let CircleColorRed = Color(red: 255 / 255, green: 127 / 255, blue: 127 / 255)
    let CircleColorGreen = Color(red: 184 / 255, green: 243 / 255, blue: 213 / 255)
    let CircleColorYellow = Color(red: 255 / 255, green: 198 / 255, blue: 0 / 255)
    var circleColor = Color.blue
    
    @State var todos = [ToDo(title: "Potato",priority: "CircleColorRed"), ToDo(title: "respond to questions", priority: "CircleColorYellow"), ToDo(title: "ignore haters", priority: "CircleColorGreen")]
    
    
    var body: some View {
        
        List {
            ForEach(todos) { todo in
                let todoIndex = todos.firstIndex(of: todo)!
                VStack(alignment: .leading) {
                    NavigationLink(destination: GoalDetailView(todo: $todos[todoIndex])) {
                        VStack {
                            HStack {
                                Text( todo.title)
                                    .bold()
                                Spacer()
                                HStack (alignment: .bottom) {
                                    if todo.priority == "CircleColorRed" {
                                        Image(systemName: "circle.fill").foregroundColor(CircleColorRed)
                                    }
                                    else if todo.priority == "CircleColorYellow" {
                                        Image(systemName: "circle.fill").foregroundColor(CircleColorYellow)
                                    }
                                    else if todo.priority == "CircleColorGreen" {
                                        Image(systemName: "circle.fill").foregroundColor(CircleColorGreen)
                                        
                                    }
                                }
                            }
                        }
                    }
                }
                
            }
            .onDelete(perform: { offsets in
                todos.remove(atOffsets: offsets)
            })
            .onMove { source, destination in
                todos.move(fromOffsets: source, toOffset: destination)
            }
        }
        .navigationTitle("Goals")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                EditButton()
            }
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    
                } label: {
                    Image(systemName: "plus")
                }
            }
        }
    }
}

struct GoalsScreen_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            GoalsScreen()
        }
    }
}
