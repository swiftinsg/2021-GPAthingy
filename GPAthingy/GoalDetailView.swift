//
//  GoalDetailView.swift
//  GPAthingy
//
//  Created by Yashvi Shah on 18/11/21.
//

import SwiftUI

struct GoalDetailView: View {
    
    @Binding var todo: ToDo
    
    var body: some View {
        Form {
            Section(header: Text("goal title")) {
                TextField("Whats your goal?", text: $todo.title)
            }
            
            Section(header: Text("priority")) {
                HStack {
                    Button{
                    
                    } label: {
                        Image(systemName: "circle.fill")
                            .foregroundColor(CircleColorRed)
                }
            
                    Button{
                    
                    } label: {
                        Image(systemName: "circle.fill")
                            .foregroundColor(CircleColourYellow)
                }
                    Button{
                    
                    } label: {
                        
                    }
                        Image(systemName: "circle.fill")
                            .foregroundColor(CircleColourGreen)
                }
            }
        }
        .navigationTitle(ToDo.title)
    }
}

struct GoalDetailView_Previews: PreviewProvider {
    static var previews: some View{
        GoalDetailView(todo: .constant(ToDo(title: "ignore yi kai", priority: .high)))
    }
}
