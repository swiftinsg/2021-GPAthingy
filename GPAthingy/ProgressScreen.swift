//
//  ProgressScreen.swift
//  GPA
//
//  Created by Yashvi Shah on 13/11/21.
//

import SwiftUI


let Color_cdc1ff = Color(red: 205 / 255, green: 193 / 255, blue: 255 / 255)

let Color_7371fc = Color(red: 115 / 255, green: 113 / 255, blue: 252 / 255)

let Color_F5EFFF = Color(red: 245 / 255, green: 239 / 255, blue: 255 / 255)

let Color_A594F9 = Color(red: 165 / 255, green: 148 / 255, blue: 249 / 255)



struct ProgressScreen: View {
    var body: some View {
        ZStack {
            
            Rectangle()
                .frame(width: 354, height: 49)
                .foregroundColor(Color_cdc1ff)
                .cornerRadius(15)
            
            Text("Subject goes here")
                .frame(width: 300, height: 49)
                .foregroundColor(Color.black)
                .font(Font.system(size: 24, design: .default))
                .multilineTextAlignment(.leading)
                .padding(2)
            
            
            
            
        }
        
       
            
        }
    }


struct ProgressScreen_Previews: PreviewProvider {
    static var previews: some View {
        ProgressScreen()
    }
}
