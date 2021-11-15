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
        
        @State private var subject: String = ""
        
        var body: some View {
            
            
            NavigationView {
                
                VStack {
                    
                    NavigationLink(destination : TestScores()) {
                        
                        Text("Select Test")
                            .font(.system(size: 24))
                            .frame(width: 354, height: 49)
                            .foregroundColor(Color.black)
                            .background(Color_cdc1ff)
                            .cornerRadius(15)
                            .multilineTextAlignment(.leading)
                            .padding(2)
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
                    .font(.system(size: 24, weight: .bold))
                    .foregroundColor(Color.white)
                    .background(Color_7371fc)
                    .cornerRadius(15)
                    .padding(50)
                    
                }
            }
            
        }
    }

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
