//
//  GraphView.swift
//  group 3
//
//  Created by jiachen on 18/11/21.
//

import SwiftUI

let graphTop = Color(red: 201/255, green: 167 / 255, blue: 253 / 255)
let graphBottom = Color(red: 122/255, green: 118/255, blue:255/255)

struct GraphView: View {
    var values: [CGFloat] = [6, 9, 4, 2, 5]
    
    var body: some View {
        ZStack(alignment: .top) {
            
            GeometryReader { reader in
                let width = reader.size.width
                let height = reader.size.height
                
                let sectionWidth = width / CGFloat(values.count - 1)
                let maxValue = values.max()!
                let heightMultiplier = height / values.max()!
                
                LinearGradient(colors: [graphTop, graphBottom], startPoint: .top, endPoint: .bottom).mask(
                    Path { path in
                    path.move(to: CGPoint(x: 0, y: height))
                    
                    for (n, value) in values.enumerated() {
                        path.addLine(to: CGPoint(x: sectionWidth * CGFloat(n), y: (maxValue - value) * heightMultiplier))
                    }
                    
                    path.addLine(to: CGPoint(x: width, y: height))
                }
                        .fill()
                )
            }
            .padding(.top, 5)
            Rectangle()
                .frame(height: 1)
                .foregroundColor(.purple)
                .padding(.top, 5)
            
            HStack {
                Spacer()
                Text("90")
                    .font(.system(size: 16))
                    .background(Color.white)
                    .foregroundColor(.purple)
                    .frame(height: 10)
                    .padding(.trailing)
            }
        }
    }
}

struct GraphView_Previews: PreviewProvider {
    static var previews: some View {
        GraphView()
            .previewLayout(.sizeThatFits)
            .frame(width: 100, height: 100)
            .padding()
    }
}
