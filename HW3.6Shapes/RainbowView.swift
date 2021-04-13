//
//  Test.swift
//  HW3.6Shapes
//
//  Created by Alexander Konovalov on 13.04.2021.
//

import SwiftUI

struct RainbowView: View {
    let rainbSize = 300
    let rainbColors = [Color.red, Color.yellow, Color.green, Color.blue, Color.purple]
    
    @State var toPoint = 0.99
    
    var body: some View {
        VStack {
            ZStack {
                
                ForEach((0..<5)) { indx in
                    Circle()
                        .trim(from: 0.5, to: /*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/)
                        .stroke(Color.gray, style: StrokeStyle(lineWidth: 20, lineCap: .round, lineJoin: .round))
                        .frame(width: CGFloat(rainbSize-indx*41), height: CGFloat(rainbSize-indx*41))
                }
                ForEach((0..<5)) { indx in
                    Circle()
                        .trim(from: CGFloat(toPoint), to: /*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/)
                        .stroke(rainbColors[indx], style: StrokeStyle(lineWidth: 20, lineCap: .round, lineJoin: .round))
                        .frame(width: CGFloat(rainbSize-indx*41), height: CGFloat(rainbSize-indx*41))
                        .animation(Animation.easeInOut(duration: 1).repeatForever(autoreverses: true))
                }
            }
        }
        .onAppear {
            toPoint = 0.5
        }
    }
}

struct Test_Previews: PreviewProvider {
    static var previews: some View {
        RainbowView()
    }
}
