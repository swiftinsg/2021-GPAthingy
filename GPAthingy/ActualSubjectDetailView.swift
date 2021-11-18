//
//  ActualSubjectDetailView.swift
//  GPAthingy
//
//  Created by rgs on 16/11/21.
//

import SwiftUI

struct ActualSubjectDetailView: View {
    @Binding var subject: Subject
    
    let Color_red = Color(red: 255 / 255, green: 127 / 255, blue: 127 / 255)
    
    @State var scoreText = ""
    @State var totalScoreText = ""
    @State var totalScore = 0.0
    
    var body: some View {
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
                
                TextField("Score", text: $scoreText)
                    .keyboardType(.decimalPad)
                    .onChange(of: scoreText) { newValue in
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
                
                TextField("Total Score", text: $totalScoreText)
                    .keyboardType(.decimalPad)
                    .onChange(of: totalScoreText) { newValue in
                        if let total_Score = Double(totalScoreText) {
                            totalScore = total_Score
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
                
                Text("\(subject.score / totalScore, specifier: "%.2f")%")
                    .font(.system(size: 22))
                    .foregroundColor(Color.black)
                    .padding()
                    .background(Color_F5EFFF)
                    .cornerRadius(15)
            }
            
            
            
            
            Spacer()
            
            Button {
                
            } label: {
                Spacer()
                Text("Save")
                Spacer()
            }
            .font(.system(size: 22, weight: .bold))
            .foregroundColor(Color.white)
            .padding()
            .background(Color_7371fc)
            .cornerRadius(15)
            .padding(.horizontal)
            
            Button {
                
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
        .padding()
        
    }
}

struct ActualSubjectDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ActualSubjectDetailView(subject: .constant(Subject(name: "Math",
                                                           score: 0)))
    }
}
