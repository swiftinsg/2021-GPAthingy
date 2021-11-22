//
//  TestScores.swift
//  GPA
//
//  Created by cpyoufy on 13/11/21.
//

import SwiftUI

struct TestScores: View {
    @Binding var assessments: [Assessment]
    @Binding var subjects: [Subject]
    @State var isSheetPresented = false
    let listItemColor = Color(red: 245 / 255, green: 239 / 255, blue: 255 / 255)
    
    var body: some View {
        List {
            ForEach(assessments) { assessment in
                let assessmentIndex = assessments.firstIndex(of: assessment)!
                VStack(alignment: .leading) {
                    NavigationLink(destination: SubjectDetailView(subjects: $subjects, assessment: $assessments[assessmentIndex])) {
                        VStack {
                            HStack {
                                HStack (alignment: .top){
                                    Text( assessment.name)
                                        .bold()
                                }
                                Spacer()
                                HStack (alignment: .bottom) {
                                    Text("\(Int(calcAssessmentPercentage(assessment: assessment)))%")
                                }
                            }
                            ProgressView(value: calcAssessmentPercentage(assessment: assessment), total: 100)
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
                Button {
                    isSheetPresented = true
                } label: {Image(systemName: "plus")}
                EditButton()
            }
        }
        .sheet(isPresented: $isSheetPresented) {
            
            ActualNewAssessmentView(assessments: $assessments)
            
        }
        
    }
    
    func calcAssessmentPercentage(assessment: Assessment) -> Double {
        let subjects = assessment.subjectsInAssessment.map {
            $0.score / $0.totalScore
        }.reduce(0) {
            $0 + $1
        } / Double(assessment.subjectsInAssessment.count)
        
        return subjects * 100
        
        
    }
    
}

struct TestScores_Previews: PreviewProvider {
    static var previews: some View {
        TestScores(assessments: .constant([Assessment(name: "Assessment 1", totalScore: 69, numberOfSubjects: 2, subjectsInAssessment: [Subject(name: "Math", score: 69, totalScore: 420, creditHours: 2, gpa: 4.0)])]), subjects: .constant([]))
    }
}

