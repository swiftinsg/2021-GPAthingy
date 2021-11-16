//
//  TestScores.swift
//  GPA
//
//  Created by Yashvi Shah on 13/11/21.
//

import SwiftUI

struct TestScores: View {
    var assessment = [Assessment(name: "Assessment 1"),
                      Assessment(name: "Assessment 2")]
    let listItemColor = Color(red: 245 / 255, green: 239 / 255, blue: 255 / 255)
    var body: some View {
        NavigationView {
            List {
                ForEach(assessment) { assessment in
                    VStack(alignment: .leading) {
                        HStack {
                            HStack (alignment: .top){
                                Text( assessment.name)
                                    .bold()
                            }
                            Spacer()
                            HStack (alignment: .bottom) {
                               Text("69%")
                            }
                            
                            
                        }
                        
                    }
                    
                } .listRowBackground(listItemColor)
                
                .padding()
                
            } .navigationTitle("Assessments")
        }
    }
}

struct TestScores_Previews: PreviewProvider {
    static var previews: some View {
        TestScores()
    }
}
