//
//  InstructionsView.swift
//  Bullseye
//
//  Created by Richie Flores on 2/20/21.
//

import SwiftUI

struct InstructionsView: View {
    @Binding var game: Game
    
    var body: some View {
        VStack {
            InstructionText(text: "🎯🎯🎯\nPut the Bullseye as close as you can to")
                .padding(.leading, 30.0)
                .padding(.trailing, 30.0)
            BigNumberText(text: String(game.target))
        }
    }
}

struct InstructionsView_Previews: PreviewProvider {
    static var previews: some View {
        InstructionsView(game: .constant(Game()))
    }
}
