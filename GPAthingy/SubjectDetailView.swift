//
//  SubjectDetailView.swift
//
//  Created by cpyoufy on 13/11/21.
//

import SwiftUI

struct SubjectDetailView: View {
    
    @Binding var subjects: [Subject]
    
    @Binding var assessment: Assessment
    
    @State var isSheetPresented = false
    
    let listItemColor = Color(red: 245 / 255, green: 239 / 255, blue: 255 / 255)
    
    var body: some View {
        List {
            ForEach(assessment.subjectsInAssessment) { subject in
                let subjectIndex = assessment.subjectsInAssessment.firstIndex (of: subject)!
                VStack(alignment: .leading) {
                    NavigationLink(destination: ActualSubjectDetailView(subjectIndex: subjectIndex, subjects: $assessment.subjectsInAssessment)) {
                        VStack(alignment: .leading) {
                            HStack {
                                HStack (alignment: .top){
                                    Text(subject.name)
                                        .bold()
                                }
                                Spacer()
                                HStack (alignment: .bottom) {
                                    Text("\((subject.score / subject.totalScore) * 100, specifier: "%.1f")%")
                                }
                            }
                            ProgressView(value: subject.score / subject.totalScore * 100, total: 100)
                        }
                        
                    }
                }
            }
            .onDelete(perform: { offsets in
                subjects.remove(atOffsets: offsets)
            })
            .onMove { source, destination in
                subjects.move(fromOffsets: source, toOffset: destination)
            }
            .listRowBackground(listItemColor)
            
            .padding()
        }
        .navigationTitle("Subjects")
        .toolbar {
            ToolbarItemGroup(placement: .navigationBarTrailing) {
                Button {
                    isSheetPresented = true
                } label: {Image(systemName: "plus")}
                EditButton()
            }
        }
        
        .sheet(isPresented: $isSheetPresented) {
            NewAssessmentView(subjects: $assessment.subjectsInAssessment)
            
        }
    }
}
        
        struct SubjectDetailView_Previews: PreviewProvider {
            static var previews: some View {
                SubjectDetailView(subjects: .constant(
                    [Subject(name: "Math", score: 39, totalScore: 66, creditHours: 2, gpa: 4.0)]
                ), assessment: .constant(Assessment(name: "Assessment 1", totalScore: 69, numberOfSubjects: 2, subjectsInAssessment: [Subject(name: "Math", score: 69, totalScore: 420, creditHours: 2, gpa: 3.7)])))
            }
        }
    
