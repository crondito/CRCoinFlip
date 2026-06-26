//
//  ContentView.swift
//  CRCoinFlip
//
//  Created by Carlos Rodas on 2025/11/28.
//

import SwiftUI

struct ContentView: View {
    @State private var result: String = " "
    @State private var isFlipping: Bool = false

    var body: some View {
        VStack(spacing: 15) {
            Button("Flip a Coin") {
                flipCoin()
            }
            .buttonStyle(.borderedProminent)
            .controlSize(.large)
            .disabled(isFlipping)
            
            if isFlipping {
                ProgressView()
                    .controlSize(.small)
                    .padding(.horizontal)
                    .frame(maxWidth: .infinity)
            } else {
                Text(result)
                    .font(.title3)
                    .fontWeight(.medium)
                    .padding(.horizontal)
                    .frame(maxWidth: .infinity)
            }
        }
        .padding(15)

        .frame(width: 200, height: 100)
    }

    func flipCoin() {
        // Reset state
        result = " "
        isFlipping = true
        
        // Flip after delay
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            let randomNumber = Int.random(in: 0...1)

            if randomNumber == 0 {
                result = "Tails!"
            } else {
                result = "Heads!"
            }
            isFlipping = false
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
