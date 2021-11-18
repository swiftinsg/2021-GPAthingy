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
    let CircleColourGreen = Color(red: 184 / 255, green: 243 / 255, blue: 253 / 255)
    let CircleColourYellow = Color(red: 255 / 255, green: 198 / 255, blue: 0 / 255)
    
    @State var ToDo = [ToDo(title: "Potato",priority: .high), ToDo(title: "respond to questions", priority: .low), ToDo(title: "ignore haters", priority: .medium)]
    
    var body: some View {
        List {
            ForEach($ToDo) { $ToDo in
                HStack {
                    Text(ToDo.title)
                    Spacer()
                    switch ToDo.priority {
                    case .high: Image(systemName: "circle.fill").foregroundColor(CircleColorRed)
                    case .medium: Image(systemName: "circle.fill").foregroundColor(CircleColourYellow)
                    case .low: Image(systemName: "circle.fill").foregroundColor(CircleColourGreen)
                    }
                }
            }
            .onDelete { index in
                ToDo.remove(atOffsets: index)
            }
            .onMove {from, to in
                ToDo.move(fromOffsets: from, toOffset: to)
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
