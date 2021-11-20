//
//  ActualNewAssessmentView.swift
//  GPAthingy
//
//  Created by cpyoufy on 18/11/21.
//

import SwiftUI

let Color_red = Color(red: 255 / 255, green: 127 / 255, blue: 127 / 255)
let Color_purple = Color(red: 115 / 255, green: 113 / 255, blue: 252 / 255)
let Color_purple2 = Color(red: 205 / 255, green: 193 / 255, blue: 255 / 255)

struct ActualNewAssessmentView: View {
    @State var newAssessment = Assessment(name: "", totalScore: 0, numberOfSubjects: 0, subjectsInAssessment: [Subject(name: "Math", score: 69, totalScore: 420)])
    @Binding var assessments: [Assessment]
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        NavigationView {
            VStack (alignment: .leading, spacing: 0){
                Text("ASSESSMENT NAME")
                    .font(.system(size: 13, weight: .bold))
                    .padding(.horizontal)
                TextField("Assessment 1", text: $newAssessment.name )
                    .padding()
                    .background(Color_purple2)
                    .cornerRadius(15)
                    .padding()
                    
                Button {
                    assessments.append(newAssessment)
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Spacer()
                    Text("Save")
                    Spacer()
                }
                .font(.system(size: 22, weight: .bold))
                .foregroundColor(Color.white)
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color_purple)
                .cornerRadius(15)
                .padding(.horizontal)
                Spacer()
            }
            .navigationTitle("New Assessment")
        }
    }
}

struct ActualNewAssessmentView_Previews: PreviewProvider {
    static var previews: some View {
        ActualNewAssessmentView(assessments: .constant([]))
    }
}
