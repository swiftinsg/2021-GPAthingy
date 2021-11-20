//
//  ContentView.swift
//  GPAthingy
//
//  Created by cpyoufy on 15/11/21.
//

import SwiftUI

let tabBarSelectedAccent = Color(red: 134 / 255, green: 125 / 255, blue: 254 / 255) // Tab bar colour

struct ContentView: View {
    @Binding var todos: [ToDo]
    @Binding var assessments: [Assessment]
    @Binding var subjects: [Subject]
    
    var body: some View {
        TabView {
            HomeScreen()
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }
            NavigationView {
                TestScores(assessments: $assessments, subjects: $subjects)

            }
            .tabItem {
                Label("Test Scores", systemImage: "graduationcap.fill")
            }
            
            GoalsScreen(todos: $todos)
                .tabItem {
                    Label("Goals", systemImage: "paperplane.fill")
                }
            ProgressScreen()
                .tabItem {
                    Label("Progress", systemImage: "chart.xyaxis.line")
                }
        }
        .onAppear() {
            UITabBar.appearance().backgroundColor = .white
        }
        .accentColor(tabBarSelectedAccent)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(todos: .constant([ToDo(title: "Sample Goal", priority: .high)]), assessments: .constant([Assessment(name: "Assessment 1", totalScore: 69, numberOfSubjects: 2)]), subjects: .constant([Subject(name: "Math", score: 69, totalScore: 100)]))
        
    }
}



