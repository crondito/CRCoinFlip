//
//  StatusBarController.swift
//  CoinFlip
//
//  Created by Carlos Rodas on 2025/11/28.
//

import SwiftUI
import AppKit

// Status Bar Controller manages the icon and the popover lifecycle
class StatusBarController: NSObject, NSMenuDelegate {
    // The NSStatusItem is the icon in the menu bar
    private var statusItem: NSStatusItem!
    // The NSPopover holds our SwiftUI ContentView
    private var popover: NSPopover!
    
    // Initializer sets up the status item and popover
    override init() {
        super.init()
        
        // 1. Set up the Status Item (the icon)
        // .variableLength means the width is determined by the content
        statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
        
        // Set the icon properties (using a system icon for simplicity)
        if let button = statusItem.button {
            // Using a simple system icon (a disc/dot)
            button.image = NSImage(systemSymbolName: "circle.circle", accessibilityDescription: "Coin Flip App")
            // Attach the controller as the target for clicks
            button.action = #selector(togglePopover(_:))
            button.target = self
        }
        
        // 2. Set up the Popover
        popover = NSPopover()
        // Make the popover detachable and transient
        popover.behavior = .transient
        // Set the SwiftUI View as the content of the popover
        popover.contentViewController = NSHostingController(rootView: ContentView())
    }
    
    // Selector method called when the status item is clicked
    @objc func togglePopover(_ sender: AnyObject?) {
        if popover.isShown {
            // If the popover is visible, close it
            popover.performClose(sender)
        } else {
            // If the popover is hidden, show it
            if let button = statusItem.button {
                popover.show(relativeTo: button.bounds, of: button, preferredEdge: .minY)
            }
        }
    }
}
