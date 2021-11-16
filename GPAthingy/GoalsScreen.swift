//
//  GoalsScreen.swift
//  GPA
//
//  Created by Yashvi Shah on 13/11/21.
//

import SwiftUI

struct GoalsScreen: View {
    
    let listItemColor = Color(red: 245 / 255, green: 239 / 255, blue: 255 / 255)
    
    var todo = [ToDo(name: "Read Math Textbook"),
                ToDo(name: "Holiday Homework"),
                ToDo(name: "Read Up On Thesis")]
    
    var body: some View {
        List {
            ForEach(todo) { todo in
                VStack(alignment: .leading) {
                    HStack {
                        HStack (alignment: .top){
                            Text( todo.name)
                                .bold()
                        }
                        Spacer()
                        HStack (alignment: .bottom) {
                            
                            Circle()
                                .frame(width: 28, height: 18)
                        }
                        
                        
                    }
                    
                }
                .cornerRadius(10.0)
                
            } .listRowBackground(listItemColor)
            
                .padding()
            
            
            
            
        }
    }
    
    struct GoalsScreen_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
 }

