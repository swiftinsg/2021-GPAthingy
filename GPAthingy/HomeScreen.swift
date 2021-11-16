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
    
    var body: some View {
        
        
        NavigationView {
            
            VStack {
                
                VStack {
                    Text("Welcome back")
                        .bold()
                        .font(.system(size: 24))
                        .padding()
                    
                    Text("Take a break recharge every now and then!")
                        .font(.system(size: 18))
                        .padding()
                }
                .padding(.top, 40)
                
                
                ZStack {
                    ZStack {
                        Rectangle()
                            .frame(width: 400, height: 410)
                            .cornerRadius(20)
                        .foregroundColor(Color_F5EFFF)
                        
                        HStack {
                            
                            Image(systemName: "lightbulb.fill")
                                .foregroundColor(Color_A594F9)
                            
                            Text("GPA Calculator")
                                .bold()
                            
                        }
                        .offset(x : -100, y: -183)
                        .padding()
                    }
                    
                    
                    
                    VStack {
                        
                        NavigationLink(destination : TestScores()) {
                            
                            ZStack {
                                
                                Rectangle()
                                    .frame(width: 354, height: 49)
                                    .foregroundColor(Color_cdc1ff)
                                    .cornerRadius(15)
                                
                                HStack {
                                    Text("Select Test")
                                        .font(.system(size: 24))
                                        .foregroundColor(Color.black)
                                        .padding(2)
                                        .offset(x : -100)
                                    
                                }
                            }
                        }
                        
                        
                        
                        ZStack {
                            
                            Rectangle()
                                .frame(width: 354, height: 49)
                                .foregroundColor(Color_cdc1ff)
                                .cornerRadius(15)
                            
                            TextField("Subject" , text : $subject)
                                .frame(width: 300, height: 49)
                                .foregroundColor(Color.black)
                                .font(Font.system(size: 24, design: .default))
                                .multilineTextAlignment(.leading)
                                .padding(2)
                            
                            
                        }
                        
                        ZStack {
                            
                            Rectangle()
                                .frame(width: 354, height: 49)
                                .foregroundColor(Color_cdc1ff)
                                .cornerRadius(15)
                            
                            TextField("Score" , text : $subject)
                                .frame(width: 300, height: 49)
                                .foregroundColor(Color.black)
                                .font(Font.system(size: 24, design: .default))
                                .multilineTextAlignment(.leading)
                                .padding(3)
                            
                            
                        }
                        
                        Button ("Calculate") {
                        }
                        .frame(width: 354, height: 49)
                        .font(.system(size: 22, weight: .bold))
                        .foregroundColor(Color.white)
                        .background(Color_7371fc)
                        .cornerRadius(15)
                        .padding(50)
                    }
                }
                
                Spacer()
            }
            .edgesIgnoringSafeArea(.all)
            
        }
        
    }
    
    
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}



