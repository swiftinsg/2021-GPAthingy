//
//  ActualNewAssessmentView.swift
//  GPAthingy
//
//  Created by cpyoufy on 18/11/21.
//

import SwiftUI

let Color_red = Color(red: 255 / 255, green: 127 / 255, blue: 127 / 255)
let Color_purple = Color(red: 115 / 255, green: 113 / 255, blue: 252 / 255)

struct ActualNewAssessmentView: View {
    @State var newAssessment = Assessment(name: "", totalScore: 0, numberOfSubjects: 0)
    @Binding var assessments: [Assessment]
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        NavigationView {
            Form {
                TextField("Assessment Name", text: $newAssessment.name )
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
            }
        } .navigationTitle("New Assessment")
    }
}

struct ActualNewAssessmentView_Previews: PreviewProvider {
    static var previews: some View {
        ActualNewAssessmentView(assessments: .constant([]))
    }
}
