//
//  NewGoalScreenView.swift
//  GPAthingy
//
//  Created by Yashvi Shah on 19/11/21.
//

import SwiftUI

struct NewGoalScreenView: View {
    
    let listItemColor = Color(red: 245 / 255, green: 239 / 255, blue: 255 / 255)
    let CircleColorRed = Color(red: 255 / 255, green: 127 / 255, blue: 127 / 255)
    let CircleColorGreen = Color(red: 184 / 255, green: 243 / 255, blue: 213 / 255)
    let CircleColorYellow = Color(red: 255 / 255, green: 198 / 255, blue: 0 / 255)
    let Color_purple = Color(red: 115 / 255, green: 113 / 255, blue: 252 / 255)
    let Color_purple2 = Color(red: 205 / 255, green: 193 / 255, blue: 255 / 255)
    
    @State var newTodo = ToDo(title: "", priority: .high)
    @Binding var todos: [ToDo]
    @State var newgoal: String = ""
    @Environment(\.presentationMode) var presentationMode

    
    var body: some View {
        NavigationView {
            VStack (alignment: .leading, spacing: 0){
                Form {
                    Section(header: Text("Goal Title")) {
                        TextField("What's your goal?", text: $newTodo.title)
                    }
                    
                    
                    Section(header: Text("priority")) {
                        HStack {
                            Button{
                                newTodo.priority = .high
                            } label: {
                                if newTodo.priority == .high {
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
                                newTodo.priority = .mid
                            } label: {
                                if newTodo.priority == .mid {
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
                                newTodo.priority = .low
                            } label: {
                                if newTodo.priority == .low {
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
                
                
                
                
                /*               TextField("Goal", text: $newgoal)
                 .padding()
                 .background(Color_purple2)
                 .cornerRadius(15)
                 .padding()
                 */
                Spacer()
                Button {
                    todos.append(newTodo)
                    presentationMode.wrappedValue.dismiss()
                }
            label: {
                Spacer()
                Text("Save")
                Spacer()
            }
            .font(.system(size: 22, weight: .bold))
            .foregroundColor(Color.white)
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color_purple)
            .cornerRadius(15)
            .padding()
                
                
                Button("Discard Goal") {
                    presentationMode.wrappedValue.dismiss()
                }
                .frame(maxWidth: .infinity)
                .padding()
                .foregroundColor(Color.white)
                .background(CircleColorRed)
                .font(.system(size: 22, weight: .bold))
                .cornerRadius(15)
                .padding(.horizontal)
                
                
                
            }.navigationTitle("New Goal")
        }
    }
}

