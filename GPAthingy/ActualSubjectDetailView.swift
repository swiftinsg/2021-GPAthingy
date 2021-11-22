//
//  ActualSubjectDetailView.swift
//  GPAthingy
//
//  Created by rgs on 16/11/21.
//

import SwiftUI

struct ActualSubjectDetailView: View {
    @State var subject = Subject(name: "", score: 0, totalScore: 0, creditHours: 2)
    var subjectIndex: Int
    @Binding var subjects: [Subject]
    
    
    let Color_red = Color(red: 255 / 255, green: 127 / 255, blue: 127 / 255)
    let Color_purple = Color(red: 115 / 255, green: 113 / 255, blue: 252 / 255)
    
    @State var scoreText = ""
    @State var totalScoreText = ""
    @State var creditText = ""
    @State var achievedScore = 0.0
    @State var totalScore = 0.0
    
    var body: some View {
        ScrollView {
            VStack {
                
                VStack(alignment: .leading) {
                    Text("TEST TITLE")
                        .font(.system(size: 13, weight: .bold))
                    
                    
                    TextField("Subject", text: $subject.name)
                        .font(.system(size: 22))
                        .foregroundColor(Color.black)
                        .padding()
                        .background(Color_F5EFFF)
                        .cornerRadius(15)
                }
                
                
                VStack(alignment: .leading) {
                    Text("SCORE")
                        .font(.system(size: 13, weight: .bold))
                    
                    TextField("\(subject.score)", text: $scoreText)
                        .keyboardType(.decimalPad)
                        .onChange(of: scoreText) { newValue in
                            
                            if scoreText.count > 8 {
                                scoreText.removeLast()
                            }
                            
                            if let score = Double(scoreText) {
                                subject.score = score
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
                    
                    TextField("\(subject.totalScore)", text: $totalScoreText)
                        .keyboardType(.decimalPad)
                        .onChange(of: totalScoreText) { newValue in
                            
                            if totalScoreText.count > 8 {
                                totalScoreText.removeLast()
                            }
                            
                            
                            
                            if let total_Score = Double(totalScoreText) {
                                subject.totalScore = total_Score
                            }
                        }
                        .font(.system(size: 22))
                        .foregroundColor(Color.black)
                        .padding()
                        .background(Color_F5EFFF)
                        .cornerRadius(15)
                    
                }
                
                VStack(alignment: .leading) {
                    Text("CREDIT HOURS")
                        .font(.system(size: 13, weight: .bold))
                    
                    TextField("\(subject.creditHours)", text: $creditText)
                        .keyboardType(.decimalPad)
                        .onChange(of: creditText) { newValue in
                            
                            if creditText.count > 8 {
                                creditText.removeLast()
                            }
                            
                            if let credits = Double(creditText) {
                                subject.creditHours = credits
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
                    
                    Text("\((subject.score / subject.totalScore) * 100, specifier: "%.1f")%")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.system(size: 22))
                        .foregroundColor(Color.black)
                        .padding()
                        .background(Color_F5EFFF)
                        .cornerRadius(15)
                }
                
                VStack(alignment: .leading) {
                    Text("GPA of subject")
                        .font(.system(size: 13, weight: .bold))
                    
                    var percentageScore = subject.score / subject.totalScore
                    
                    if percentageScore > 92 {
                        Text("\((subject.score / subject.totalScore) * 10 * subject.creditHours, specifier: "%.1f")")
                    }
                    
                    Text("\((subject.score / subject.totalScore) * 10 * subject.creditHours, specifier: "%.1f")")
                }
                
                Spacer()
                
                Button {
                    subjects[subjectIndex] = subject
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
                
                Button {
                    subjects.remove(at: subjectIndex)
                } label: {
                    Spacer()
                    Text("Delete")
                    Spacer()
                }
                .font(.system(size: 22, weight: .bold))
                .foregroundColor(Color.white)
                .padding()
                .background(Color_red)
                .cornerRadius(15)
                .padding(.horizontal)
                
            }
            .onAppear {
                subject = subjects[subjectIndex]
            }
            .padding()
        }
        
    }
}

struct ActualSubjectDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ActualSubjectDetailView(subjectIndex: 0, subjects: .constant([Subject(name: "Jia chen", score: 69, totalScore: 420,  creditHours: 2)]))
    }
}
