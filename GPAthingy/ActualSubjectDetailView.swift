//
//  ActualSubjectDetailView.swift
//  GPAthingy
//
//  Created by rgs on 16/11/21.
//

import SwiftUI

extension Double {
    func removeZerosFromEnd() -> String {
        let formatter = NumberFormatter()
        let number = NSNumber(value: self)
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 16 //maximum digits in Double after dot (maximum precision)
        return String(formatter.string(from: number) ?? "")
    }
}

struct ActualSubjectDetailView: View {
    @Binding var subject: Subject
    
    let Color_red = Color(red: 255 / 255, green: 127 / 255, blue: 127 / 255)
    
    @State var scoreText = ""
    @State var totalScoreText = ""
    @State var achievedScore = 0.0
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
                
                TextField("\(subject.score)", text: $scoreText)
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
                
                TextField("\(subject.totalScore)", text: $totalScoreText)
                    .keyboardType(.decimalPad)
                   .onChange(of: totalScoreText) { newValue in
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
            
            
            
            
            Spacer()
            
            
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
                                                           score: 5, totalScore: 10)))
    }
}
