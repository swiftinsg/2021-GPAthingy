//
//  ContentView.swift
//  GPAthingy
//
//  Created by rgs on 15/11/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            HomeScreen()
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }
            TestScores()
                .tabItem {
                    Label("Test Scores", systemImage: "graduationcap.fill")
                }
            GoalsScreen()
                .tabItem {
                    Label("Goals", systemImage: "paperplane.fill")
                }
            ProgressScreen()
                .tabItem {
                    Label("Progress", systemImage: "dotgraph.fill")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
