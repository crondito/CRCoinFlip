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
        Settings {
            EmptyView()
        }
    }
}
