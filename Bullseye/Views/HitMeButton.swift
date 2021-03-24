//
//  HitMeButton.swift
//  Bullseye
//
//  Created by Richie Flores on 2/20/21.
//

import SwiftUI

struct HitMeButton: View {
    @Binding var alertIsVisible: Bool
    @Binding var sliderValue: Double
    @Binding var game: Game
    
    var body: some View {
        Button(action:{
            withAnimation{
                self.alertIsVisible = true
            }
        }) {
            Text("Hit Me!".uppercased())
                .bold()
                .font(.title3)
        }
        .padding(20.0)
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
}

struct HitMeButton_Previews: PreviewProvider {
    static var previews: some View {
        HitMeButton(alertIsVisible: .constant(false), sliderValue: .constant(30.0), game: .constant(Game()))
    }
}
