//
//  ContentView.swift
//  GPAthingy
//
//  Created by cpyoufy on 15/11/21.
//

import SwiftUI

let tabBarSelectedAccent = Color(red: 134 / 255, green: 125 / 255, blue: 254 / 255)

struct ContentView: View {
    @Binding var assessments: [Assessment]
    var body: some View {
        TabView {
            HomeScreen()
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }
            NavigationView {
                TestScores(assessments: .constant([Assessment(name: "Assessment 1", totalScore: 69, numberOfSubjects: 2)]))

            }
            .tabItem {
                Label("Test Scores", systemImage: "graduationcap.fill")
            }
            
            GoalsScreen()
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
        ContentView(assessments: .constant([Assessment(name: "Assessment 1", totalScore: 69, numberOfSubjects: 2)]))
        
    }
}



