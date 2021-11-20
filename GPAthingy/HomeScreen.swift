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
    
    @State private var subject: String = ""
    @State private var score: String = ""
    @State private var credits: String = ""
    
    

    
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
                    
                    NavigationLink(destination: AssessmentSelectionView()) {
                        Text("Select Assessment")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding()
                            .background(Color_cdc1ff)
                            .cornerRadius(16)
                            .foregroundColor(.black)
                    }
                    
                    
                    TextField("Credit Hours", text: $credits)
                        .keyboardType(.decimalPad)
                        .padding()
                        .background(Color_cdc1ff)
                        .cornerRadius(16)
                    
                    
                    Button {
                        print(calcGPA([Topic(creditScore: 4.0, credit: 2), Topic(creditScore: 3.33, credit: 5)]))
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
                        
                    }

                      
            
                        
                }
                .padding()
                .background(Color_F5EFFF)
                .cornerRadius(20)
                .padding()
                Spacer()
                GraphView()
            }
            .navigationBarHidden(true)


            
        }
    }
}




struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}



