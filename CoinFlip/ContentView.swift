//
//  ContentView.swift
//  CoinFlip
//
//  Created by Carlos Rodas on 2025/11/28.
//

import SwiftUI

struct ContentView: View {
    // State variable to hold the result of the coin flip
    @State private var result: String = " "
    // State variable to track if the coin is currently flipping
    @State private var isFlipping: Bool = false

    var body: some View {
        VStack(spacing: 15) {
            Button("Flip a Coin") {
                flipCoin()
            }
            .buttonStyle(.borderedProminent) // Use a prominent style for macOS
            .controlSize(.large)
            .disabled(isFlipping) // Disable button while flipping
            
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
                    .frame(maxWidth: .infinity) // Ensure text takes full width for centering
            }
        }
        .padding(15)
        // Set a fixed, small size for the popover window
        .frame(width: 200, height: 100)
    }

    // The core logic for the 50/50 coin flip
    func flipCoin() {
        // Clear the result immediately to show the "waiting" state
        result = " "
        isFlipping = true
        
        // Execute the coin flip logic after a 1-second delay
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            // Generate a random integer: 0 or 1
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

// Preview provider for Xcode Canvas (not needed for the app to run)
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
