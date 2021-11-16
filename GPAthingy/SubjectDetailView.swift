//
//  SubjectDetailView.swift
//
//  Created by cpyoufy on 13/11/21.
//

import SwiftUI

struct SubjectDetailView: View {
    
    @Binding var assessment: Assessment;
    
    @State var subject = [Subject(name: "Math", score: 50),
                   Subject(name: "English", score: 69)]
    
    let listItemColor = Color(red: 245 / 255, green: 239 / 255, blue: 255 / 255)
    var body: some View {
        List {
            ForEach(0 ..< subject.count) { index in
                VStack(alignment: .leading) {
                    NavigationLink(destination: ActualSubjectDetailView(subject: $subject[index])) {
                        VStack(alignment: .leading) {
                            HStack {
                                HStack (alignment: .top){
                                    Text(subject[index].name)
                                        .bold()
                                }
                                Spacer()
                                HStack (alignment: .bottom) {
                                    Text("\(Int(subject[index].score))%")
                                }
                            }
                            ProgressView(value: subject[index].score, total: 100)
                        }
                        
                    }
                }
                
            } .listRowBackground(listItemColor)
            
            .padding()
            
        } .navigationTitle("Subjects")
    }
}


struct SubjectDetailView_Previews: PreviewProvider {
    static var previews: some View {
        SubjectDetailView(assessment:  .constant (Assessment(name: "Assessment 1", totalScore: 69, numberOfSubjects: 2)))
    }
}
