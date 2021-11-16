//
//  SubjectDetailView.swift
//
//  Created by cpyoufy on 13/11/21.
//

import SwiftUI

struct SubjectDetailView: View {
    var assessment: Assessment;
    
    var subject = [Subject(name: "Math"),
                      Subject(name: "English")]
    
    let listItemColor = Color(red: 245 / 255, green: 239 / 255, blue: 255 / 255)
    var body: some View {
        NavigationView {
            List {
                ForEach(subject) { subject in
                    VStack(alignment: .leading) {
                        NavigationLink(destination: ActualSubjectDetailView(subject: subject)) {
                            HStack {
                                HStack (alignment: .top){
                                    Text( subject.name)
                                        .bold()
                                }
                                Spacer()
                                HStack (alignment: .bottom) {
                                    Text("69%")
                                }
                            }
                            
                        }
                        
                    }
                    
                } .listRowBackground(listItemColor)
                
                .padding()
                
            } .navigationTitle("Subjects")
        }
    }
}

struct SubjectDetailView_Previews: PreviewProvider {
    static var previews: some View {
        SubjectDetailView(assessment:  Assessment(name: "Assessment 1"))
    }
}
