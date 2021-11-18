//
//  TestScores.swift
//  GPA
//
//  Created by cpyoufy on 13/11/21.
//

import SwiftUI

struct TestScores: View {
    @Binding var assessments: [Assessment]
    let listItemColor = Color(red: 245 / 255, green: 239 / 255, blue: 255 / 255)
    
    var body: some View {
        List {
            ForEach(assessments) { assessment in
                let assessmentIndex = assessments.firstIndex(of: assessment)!
                VStack(alignment: .leading) {
                    NavigationLink(destination: SubjectDetailView(assessment: $assessments[assessmentIndex])) {
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
                
            }
            .onDelete(perform: { offsets in
                assessments.remove(atOffsets: offsets)
            })
            .onMove { source, destination in
                assessments.move(fromOffsets: source, toOffset: destination)
            }
            .listRowBackground(listItemColor)
            
            .padding()
            
        }
        .navigationTitle("Assessments")
        .toolbar {
            ToolbarItemGroup(placement: .navigationBarTrailing) {
                Button { } label: {Image(systemName: "plus")}
                EditButton()
            }
        }
    }
    
}

struct TestScores_Previews: PreviewProvider {
    static var previews: some View {
        TestScores(assessments: .constant([Assessment(name: "Assessment 1", totalScore: 69, numberOfSubjects: 2)]))
    }
}

