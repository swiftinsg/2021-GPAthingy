//
//  NewAssessmentView.swift
//  GPAthingy
//
//  Created by cpyoufy on 17/11/21.
//

// Actually NewSubjectView.swift

import SwiftUI

struct NewAssessmentView: View {
    
    @State var subjectName = ""
    @State var score = ""
    @State var scoreInt = 0.0
    @State var totalScore = ""
    @State var totalScoreInt = 0.0
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("SUBJECT NAME")
                .font(.system(size: 13))
                .bold()
            
            TextField("Meth", text: $subjectName)
                .padding()
                .background(Color_F5EFFF)
                .cornerRadius(15)
            
            
            Text("SCORE")
                .font(.system(size: 13))
                .bold()
            
            TextField("69", text: $score)
                .keyboardType(.decimalPad)
                .onChange(of: score) { newValue in
                    
                    if score.count > 8 {
                        score.removeLast()
                    }
                    
                    if let score = Double(score) {
                        scoreInt = score
                    }
                }
                .padding()
                .background(Color_F5EFFF)
                .cornerRadius(15)
            
            Text("TOTAL SCORE")
                .font(.system(size: 13))
                .bold()
            
            TextField("40269", text: $totalScore)
                .keyboardType(.decimalPad)
                .onChange(of: totalScore) { newValue in
                    
                    if totalScore.count > 8 {
                        totalScore.removeLast()
                    }
                    
                    if let score = Double(totalScore) {
                        totalScoreInt = score
                    }
                }
                .padding()
                .background(Color_F5EFFF)
                .cornerRadius(15)
            
            
            Text("PERCENTAGE")
                .font(.system(size: 13))
                .bold()
            
            Text("\((scoreInt / totalScoreInt) * 100, specifier: "%.1f")%")
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .background(Color_F5EFFF)
                .cornerRadius(15)

            
            
            Spacer()
            
            Button {
                
            } label: {
                Spacer()
                Text("Save")
                Spacer()
            }
            .font(.system(size: 22, weight: .bold))
            .foregroundColor(.white)
            .padding()
            .background(Color_7371fc)
            .cornerRadius(15)
        }
        .padding()
    }
}

struct NewAssessmentView_Previews: PreviewProvider {
    static var previews: some View {
        NewAssessmentView()
    }
}
