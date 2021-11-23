//
//  HomeScreen.swift
//  GPA
//
//  Created by Yashvi Shah on 13/11/21.
//

import SwiftUI

struct Topic {
    var creditScore: Float;
    var credit: Int;
}

func calcAssessmentPercentage(assessment: Assessment) -> Double {
    let subjects = assessment.subjectsInAssessment.map {
        $0.score / $0.totalScore
    }.reduce(0) {
        $0 + $1
    } / Double(assessment.subjectsInAssessment.count)
    
    return subjects * 100
}

func totalSubjGPACredit(assessment: Assessment) -> Double {
    var credits: Double = 0
    let subjects = assessment.subjectsInAssessment.map {
        $0.gpa * $0.creditHours
    }.reduce(0) {
        $0 + $1
    }
    for subject in assessment.subjectsInAssessment {
        credits += subject.creditHours
    }
    return subjects / credits
}

func calcGPA(_ topics: [Topic]) -> Float {
    var totalCredit = 0;
    var creditScored: Float = 0;
    for i in topics {
        totalCredit += i.credit;
        creditScored += i.creditScore*Float(i.credit);
    }
    return creditScored / Float(totalCredit)
}


struct HomeScreen: View {
    
    
    let Color_cdc1ff = Color(red: 205 / 255, green: 193 / 255, blue: 255 / 255)
    
    let Color_7371fc = Color(red: 115 / 255, green: 113 / 255, blue: 252 / 255)
    
    let Color_F5EFFF = Color(red: 245 / 255, green: 239 / 255, blue: 255 / 255)
    
    let Color_A594F9 = Color(red: 165 / 255, green: 148 / 255, blue: 249 / 255)
    
    @State var subject: String = ""
    @State var score: String = ""
    @State var results: Double = 0
    @State var assessmentIndex = 0
    @State var credit: Double = 0
    @Binding var assessments: [Assessment]
    @State var showResults: Bool = false
    

    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                VStack(alignment: .center) {
                    
                    Text("Welcome back")
                        .bold()
                        .font(.system(size: 24))
                        .padding(.horizontal)
                    
                    Text("Take a break to recharge every now and then!")
                        .font(.system(size: 18))
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                }
                .frame(maxWidth: .infinity)
                
                VStack(alignment: .leading) {
                    HStack {
                        Image(systemName: "lightbulb.fill")
                            .foregroundColor(Color_A594F9)
                        
                        Text("GPA Calculator")
                            .bold()
                            .padding()
                    }
                    
                    Picker("Select Assessment", selection: $assessmentIndex) {
                        ForEach(0 ..< assessments.count) { n in
                            Text(assessments[n].name)
                                .tag(n)
                        }
                    }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                        .background(Color_cdc1ff)
                        .cornerRadius(16)
                        .foregroundColor(.black)
//
//                    TextField("Credit Hours", text: $credits)
//                        .keyboardType(.decimalPad)
//                        .padding()
//                        .background(Color_cdc1ff)
//                        .cornerRadius(16)
//
                    
                    Button {
                        print(assessments[assessmentIndex])
                        results = totalSubjGPACredit(assessment: assessments[assessmentIndex])
                        print(results)
                        showResults = true
                    } label: {
                        HStack {
                            Spacer()
                            Text("Calculate")
                            Spacer()
                            
                        }
                        .font(.system(size: 22, weight: .bold))
                        .foregroundColor(Color.white)
                        .padding()
                        .background(Color_7371fc)
                        .cornerRadius(15)
                        .padding(.vertical)

                        
                    }

                
                    if showResults {
                        Text("GPA: \(results, specifier: "%.1f")")
                    }
            
                        
                }
                .padding()
                .background(Color_F5EFFF)
                .cornerRadius(20)
                .padding()
                Spacer()
               
            }
            .navigationBarHidden(true)


            
        }
    }
}




struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen(assessments: .constant([Assessment(name: "Assessment 1", totalScore: 69, numberOfSubjects: 2, subjectsInAssessment: [Subject(name: "Math", score: 69, totalScore: 420, creditHours: 2, gpa: 4.0)])]))
    }
}



