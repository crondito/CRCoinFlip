//
//  CoinFlipApp.swift
//  CoinFlip
//
//  Created by Carlos Rodas on 2025/11/28.
//

import SwiftUI

@main
struct CoinFlipApp: App {
    // Instantiate the controller once and keep a strong reference to it.
    // Declaring it as a 'let' property in the App struct ensures it is
    // initialized and kept alive for the duration of the application.
    private let statusBarController = StatusBarController()

    var body: some Scene {
        // We use an Empty Scene to prevent the app from creating a main window.
        // All functionality is managed by the StatusBarController.
        EmptyScene()
    }
}

// A simple Scene replacement to prevent default window creation.
struct EmptyScene: Scene {
    var body: some Scene {
        // This is a dummy window that is never shown.
        WindowGroup {
            // Use an empty view to satisfy the requirement of WindowGroup
            // We use .hidden to ensure the Dock icon doesn't appear for this dummy window.
            Color.clear.frame(width: 0, height: 0).hidden()
        }
    }
}
