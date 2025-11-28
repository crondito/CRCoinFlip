//
//  StatusBarController.swift
//  CoinFlip
//
//  Created by Carlos Rodas on 2025/11/28.
//

import SwiftUI
import AppKit

// Manages the menu bar icon and popover.
class StatusBarController: NSObject, NSMenuDelegate {
    private var statusItem: NSStatusItem!
    private var popover: NSPopover!
    
    override init() {
        super.init()
        
        // Setup Status Item
        statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
        
        // Set the icon properties (using a system icon for simplicity)
        if let button = statusItem.button {
            button.image = NSImage(systemSymbolName: "circle.circle", accessibilityDescription: "Coin Flip App")
            button.action = #selector(togglePopover(_:))
            button.target = self
        }
        
        // Setup Popover
        popover = NSPopover()
        popover.contentSize = NSSize(width: 200, height: 100)
        popover.behavior = .transient
        popover.contentViewController = NSHostingController(rootView: ContentView())
    }
    
    @objc func togglePopover(_ sender: AnyObject?) {
        if popover.isShown {
            popover.performClose(sender)
        } else {
            if let button = statusItem.button {
                popover.show(relativeTo: button.bounds, of: button, preferredEdge: .minY)
            }
        }
    }
}
