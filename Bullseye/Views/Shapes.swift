//
//  Shapes.swift
//  Bullseye
//
//  Created by Richie Flores on 3/6/21.
//

import SwiftUI

struct Shapes: View {
    @State private var wideShapes = true
    
    var body: some View {
        VStack {
            if !wideShapes {
                Circle()
                    .strokeBorder(Color.blue, lineWidth: 20.0)
                    .frame(width: 200, height: 100)
                    .shadow(radius: 10, x: 5, y: 5)
                    .transition(.opacity)
            }
            
            RoundedRectangle(cornerRadius: 20.0)
                .fill(Color.blue)
                .frame(width: wideShapes ? 200 : 100, height: 100.0)
                .shadow(radius: 10, x: 5, y: 5)
            
            Capsule()
                .fill(Color.blue)
                .frame(width: wideShapes ? 200 : 100, height: 100)
                .shadow(radius: 10, x: 5, y: 5)
            
            Ellipse()
                .fill(Color.blue)
                .frame(width: wideShapes ? 200 : 100, height: 100)
                .shadow(radius: 10, x: 5, y: 5)
            
            Button("Animate!") {
                withAnimation {
                    wideShapes.toggle()
                }
            }
            .padding(10.0)
            .background(
                ZStack {
                    Color("ButtonColor")
                    LinearGradient(
                        gradient: Gradient(colors: [Color.white.opacity(0.3), Color.clear]),
                        startPoint: .top,
                        endPoint: .bottom)
                })
            .foregroundColor(Color.white)
            .cornerRadius(Constants.General.roundRectCornerRadius)
            .font(.title)
            .overlay(RoundedRectangle(cornerRadius: Constants.General.roundRectCornerRadius)
                        .strokeBorder(Color.white, lineWidth: Constants.General.strokeWidth)
            )
        }
        .padding()
        .background(Color.green)
    }
}

struct Shapes_Previews: PreviewProvider {
    static var previews: some View {
        Shapes()
    }
}
