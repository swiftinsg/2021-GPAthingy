//
//  GoalDetailView.swift
//  GPAthingy
//
//  Created by Yashvi Shah on 18/11/21.
//

import SwiftUI

struct GoalDetailView: View {
    
    let CircleColorRed = Color(red: 255 / 255, green: 127 / 255, blue: 127 / 255)
    let CircleColorGreen = Color(red: 184 / 255, green: 243 / 255, blue: 213 / 255)
    let CircleColorYellow = Color(red: 255 / 255, green: 198 / 255, blue: 0 / 255)
    
    @Binding var todo: ToDo
    
    var body: some View {
        Form {
            Section(header: Text("Goal Title")) {
                TextField("What's your goal?", text: $todo.title)
            }
            
            Section(header: Text("priority")) {
                HStack {
                    Button{
                        todo.priority = .high
                    } label: {
                        if todo.priority == .high {
                            Circle()
                                .strokeBorder(Color.gray, lineWidth: 2)
                                .background(Circle().foregroundColor(CircleColorRed))
                                .frame(width:16, height:16)
                        }
                        else {
                            Circle()
                                .foregroundColor(CircleColorRed)
                                .frame(width:16, height:16)
                        }
                }
            
                    Button{
                        todo.priority = .mid
                    } label: {
                        if todo.priority == .mid {
                            Circle()
                                .strokeBorder(Color.gray, lineWidth: 2)
                                .background(Circle().foregroundColor(CircleColorYellow))
                                .frame(width:16, height:16)
                        }
                        else {
                            Circle()
                                .foregroundColor(CircleColorYellow)
                                .frame(width:16, height:16)
                        }
                }
                    Button{
                        todo.priority = .low
                    } label: {
                        if todo.priority == .low {
                            Circle()
                                .strokeBorder(Color.gray, lineWidth: 2)
                                .background(Circle().foregroundColor(CircleColorGreen))
                                .frame(width:16, height:16)
                        }
                        else {
                            Circle()
                                .foregroundColor(CircleColorGreen)
                                .frame(width:16, height:16)
                        }
                    }
                }
            } .buttonStyle(.plain)
        }
        .navigationTitle(todo.title)
    }
}

struct GoalDetailView_Previews: PreviewProvider {
    static var previews: some View{
        GoalDetailView(todo: .constant(ToDo(title: "ignore jia chen cuz he sux", priority: .low)))
    }
}
