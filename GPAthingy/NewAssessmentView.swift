//
//  ActualSubjectDetailView.swift
//  GPAthingy
//
//  Created by cpyoufy on 16/11/21.
//

import SwiftUI

struct NewAssessmentView: View {
    @State var newSubject = Subject(name: "Math", score: 69, totalScore: 420, creditHours: 2)
    @Binding var subjects: [Subject]
    @Environment(\.presentationMode) var presentationMode
    
    let Color_red = Color(red: 255 / 255, green: 127 / 255, blue: 127 / 255)
    let Color_purple = Color(red: 115 / 255, green: 113 / 255, blue: 252 / 255)
    
    @State var scoreText = ""
    @State var totalScoreText = ""
    @State var achievedScore = 0.0
    @State var totalScore = 0.0
    
    var body: some View {
        NavigationView {
            VStack {
                
                VStack(alignment: .leading) {
                    Text("TEST TITLE")
                        .font(.system(size: 13, weight: .bold))
                    
                    
                    TextField("Subject", text: $newSubject.name)
                        .font(.system(size: 22))
                        .foregroundColor(Color.gray)
                        .padding()
                        .background(Color_F5EFFF)
                        .cornerRadius(15)
                }
                
                
                VStack(alignment: .leading) {
                    Text("SCORE")
                        .font(.system(size: 13, weight: .bold))
                    
                    TextField("\(newSubject.score)", text: $scoreText)
                        .keyboardType(.decimalPad)
                        .onChange(of: scoreText) { newValue in
                            
                            if scoreText.count > 8 {
                                scoreText.removeLast()
                            }
                            
                            if let score = Double(scoreText) {
                                newSubject.score = score
                            }
                            
                            
                        }
                        .font(.system(size: 22))
                        .foregroundColor(Color.black)
                        .padding()
                        .background(Color_F5EFFF)
                        .cornerRadius(15)
                }
                
                
                VStack(alignment: .leading) {
                    Text("TOTAL SCORE")
                        .font(.system(size: 13, weight: .bold))
                    
                    TextField("\(newSubject.totalScore)", text: $totalScoreText)
                        .keyboardType(.decimalPad)
                        .onChange(of: totalScoreText) { newValue in
                            
                            if totalScoreText.count > 8 {
                                totalScoreText.removeLast()
                            }
                            
                            
                            
                            if let total_Score = Double(totalScoreText) {
                                newSubject.totalScore = total_Score
                            }
                        }
                        .font(.system(size: 22))
                        .foregroundColor(Color.black)
                        .padding()
                        .background(Color_F5EFFF)
                        .cornerRadius(15)
                    
                }
                
                VStack(alignment: .leading) {
                    Text("PERCENTAGE")
                        .font(.system(size: 13, weight: .bold))
                    
                    Text("\((newSubject.score / newSubject.totalScore) * 100, specifier: "%.1f")%")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.system(size: 22))
                        .foregroundColor(Color.black)
                        .padding()
                        .background(Color_F5EFFF)
                        .cornerRadius(15)
                }
                
                Spacer()
                
                Button {
                    subjects.append(newSubject)
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Spacer()
                    Text("Save")
                    Spacer()
                }
                .font(.system(size: 22, weight: .bold))
                .foregroundColor(Color.white)
                .padding()
                .background(Color_purple)
                .cornerRadius(15)
                .padding(.horizontal)
            }
            .padding()
            .navigationTitle("Add New Subject")
        }
        
    }
}

struct NewAssessmentView_Previews: PreviewProvider {
    static var previews: some View {
        NewAssessmentView(subjects: .constant([]))
    }
}
