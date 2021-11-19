//
//  HomeScreen.swift
//  GPA
//
//  Created by Yashvi Shah on 13/11/21.
//

import SwiftUI

struct HomeScreen: View {
    
    
    let Color_cdc1ff = Color(red: 205 / 255, green: 193 / 255, blue: 255 / 255)
    
    let Color_7371fc = Color(red: 115 / 255, green: 113 / 255, blue: 252 / 255)
    
    let Color_F5EFFF = Color(red: 245 / 255, green: 239 / 255, blue: 255 / 255)
    
    let Color_A594F9 = Color(red: 165 / 255, green: 148 / 255, blue: 249 / 255)
    
    @State private var subject: String = ""
    @State private var score: String = ""
    
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
                        Text("Select Test")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding()
                            .background(Color_cdc1ff)
                            .cornerRadius(16)
                            .foregroundColor(.black)
                    }
                    
                    TextField("Subject", text: $subject)
                        .padding()
                        .background(Color_cdc1ff)
                        .cornerRadius(16)
                    
                    TextField("Score", text: $score)
                        .keyboardType(.decimalPad)
                        .padding()
                        .background(Color_cdc1ff)
                        .cornerRadius(16)
                    
                    Button {
                        
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
                    GraphView()
                        
                }
                .padding()
                .background(Color_F5EFFF)
                .cornerRadius(20)
                .padding()
                Spacer()
            }
            .navigationBarHidden(true)
            .padding()
        }
    }
}




struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}



