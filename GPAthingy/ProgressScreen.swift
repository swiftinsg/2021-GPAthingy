//
//  ProgressScreen.swift
//  GPA
//
//  Created by Yashvi Shah on 13/11/21.
//

import SwiftUI


let Color_cdc1ff = Color(red: 205 / 255, green: 193 / 255, blue: 255 / 255)

let Color_7371fc = Color(red: 115 / 255, green: 113 / 255, blue: 252 / 255)

let Color_F5EFFF = Color(red: 245 / 255, green: 239 / 255, blue: 255 / 255)

let Color_A594F9 = Color(red: 165 / 255, green: 148 / 255, blue: 249 / 255)



struct ProgressScreen: View {
    @State var subjects: [Subject] = [Subject(name: "Math", score: 50),
                           Subject(name: "English", score: 69)]
    var body: some View {
        NavigationView {
            List {
                ForEach(subjects) {subject in
                    Text("\(subject.name)")
                }
            }
        }
        .navigationTitle("Progress")
    }
        
}

struct ProgressScreen_Previews: PreviewProvider {
    static var previews: some View {
        ProgressScreen()
    }
}
