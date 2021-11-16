//
//  SubjectDetailView.swift
//
//  Created by cpyoufy on 13/11/21.
//

import SwiftUI

struct SubjectDetailView: View {
    var assessment: Assessment;
    
    var subject = [Subject(name: "Math", score: 50),
                   Subject(name: "English", score: 69)]
    
    let listItemColor = Color(red: 245 / 255, green: 239 / 255, blue: 255 / 255)
    var body: some View {
            List {
                ForEach(subject) { subject in
                    VStack(alignment: .leading) {
                        NavigationLink(destination: ActualSubjectDetailView(subject: subject)) {
                            HStack {
                                HStack (alignment: .top){
                                    Text(subject.name)
                                        .bold()
                                }
                                Spacer()
                                HStack (alignment: .bottom) {
                                    Text("\(Int(subject.score))%")
                                }
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
        SubjectDetailView(assessment:  Assessment(name: "Assessment 1"))
    }
}
