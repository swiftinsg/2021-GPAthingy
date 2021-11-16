//
//  TestScores.swift
//  GPA
//
//  Created by cpyoufy on 13/11/21.
//

import SwiftUI

struct TestScores: View {
    var assessment = [
        Assessment(name: "Assessment 1", totalScore: 69, numberOfSubjects: 2),
        Assessment(name: "Assessment 2", totalScore: 91, numberOfSubjects: 10)]
    let listItemColor = Color(red: 245 / 255, green: 239 / 255, blue: 255 / 255)
    var body: some View {
        NavigationView {
            List {
                ForEach(assessment) { assessment in
                    VStack(alignment: .leading) {
                        NavigationLink(destination: SubjectDetailView(assessment: assessment)) {
                            VStack {
                                HStack {
                                    HStack (alignment: .top){
                                        Text( assessment.name)
                                            .bold()
                                    }
                                    Spacer()
                                    HStack (alignment: .bottom) {
                                        Text("\(Int(assessment.totalScore))%")
                                    }
                                }
                               ProgressView(value: assessment.totalScore, total: 100)
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

