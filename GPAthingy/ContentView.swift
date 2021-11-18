//
//  ContentView.swift
//  GPAthingy
//
//  Created by cpyoufy on 15/11/21.
//

import SwiftUI

let tabBarSelectedAccent = Color(red: 134 / 255, green: 125 / 255, blue: 254 / 255)

struct ContentView: View {
    var body: some View {
        TabView {
            HomeScreen()
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }
            NavigationView {
                TestScores()
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
        ContentView()
    }
}


var values: [CGFloat] = [6, 9, 4, 2, 5]

var body: some View {
    ZStack(alignment: .top) {
        
        GeometryReader { reader in
            let width = reader.size.width
            let height = reader.size.height
            
            let sectionWidth = width / CGFloat(values.count - 1)
            let maxValue = values.max()!
            let heightMultiplier = height / values.max()!
            
            LinearGradient(colors: [Color(.systemPurple), Color(.systemPink)], startPoint: .top, endPoint: .bottom).mask(
                Path { path in
                path.move(to: CGPoint(x: 0, y: height))
                
                for (n, value) in values.enumerated() {
                    path.addLine(to: CGPoint(x: sectionWidth * CGFloat(n), y: (maxValue - value) * heightMultiplier))
                }
                
                path.addLine(to: CGPoint(x: width, y: height))
            }
                    .fill()
            )
        }
        .padding(.top, 5)
        Rectangle()
            .frame(height: 1)
            .foregroundColor(.purple)
            .padding(.top, 5)
        
        HStack {
            Spacer()
            Text("90")
                .font(.system(size: 16))
                .background(Color.white)
                .foregroundColor(.purple)
                .frame(height: 10)
                .padding(.trailing)
        }
    }
}
}

struct GraphView_Previews: PreviewProvider {
static var previews: some View {
    GraphView()
        .previewLayout(.sizeThatFits)
        .frame(width: 100, height: 100)
        .padding()
}
}
