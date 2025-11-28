//
//  CoinFlipApp.swift
//  CoinFlip
//
//  Created by Carlos Rodas on 2025/11/28.
//

import SwiftUI

@main
struct CoinFlipApp: App {
    // Keep a strong reference to the controller to maintain lifecycle.
    private let statusBarController = StatusBarController()

    var body: some Scene {
        // Use EmptyScene to prevent default window creation; logic is in StatusBarController.
        EmptyScene()
    }
}

// Replacement Scene to prevent default window creation.
struct EmptyScene: Scene {
    var body: some Scene {
        // Dummy window, never shown.
        WindowGroup {
            Color.clear.frame(width: 0, height: 0).hidden()
        }
    }
}
