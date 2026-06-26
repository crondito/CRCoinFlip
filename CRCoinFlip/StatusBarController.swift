//
//  StatusBarController.swift
//  CRCoinFlip
//
//  Created by Carlos Rodas on 2025/11/28.
//

import SwiftUI
import AppKit

// Manages the menu bar icon and popover.
class StatusBarController: NSObject, NSMenuDelegate {
    private var statusItem: NSStatusItem!
    private var popover: NSPopover!
    private var menu: NSMenu!
    
    override init() {
        super.init()
        
        // Setup Status Item
        statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
        
        // Set the icon properties (using a system icon for simplicity)
        if let button = statusItem.button {
            button.image = NSImage(systemSymbolName: "circle.circle", accessibilityDescription: "CR Coin Flip")
            button.action = #selector(handleButtonClick(_:))
            button.target = self
            // Listen for both left and right clicks
            button.sendAction(on: [.leftMouseUp, .rightMouseUp])
        }
        
        // Setup Popover
        popover = NSPopover()
        popover.contentSize = NSSize(width: 200, height: 100)
        popover.behavior = .transient
        popover.contentViewController = NSHostingController(rootView: ContentView())
        
        // Setup Menu
        menu = NSMenu()
        let quitItem = NSMenuItem(title: "Quit", action: #selector(quitApp), keyEquivalent: "q")
        quitItem.target = self
        menu.addItem(quitItem)
    }
    
    @objc func handleButtonClick(_ sender: NSStatusBarButton) {
        let event = NSApp.currentEvent!
        
        if event.type == .rightMouseUp || (event.type == .leftMouseUp && event.modifierFlags.contains(.control)) {
            // Right click or Control-click: Show menu
            statusItem.menu = menu
            statusItem.button?.performClick(nil)
            statusItem.menu = nil // Reset so left click doesn't show menu automatically next time
        } else {
            // Left click: Toggle popover
            togglePopover(sender)
        }
    }
    
    func togglePopover(_ sender: AnyObject?) {
        if popover.isShown {
            popover.performClose(sender)
        } else {
            if let button = statusItem.button {
                popover.show(relativeTo: button.bounds, of: button, preferredEdge: .minY)
            }
        }
    }
    
    @objc func quitApp() {
        NSApplication.shared.terminate(nil)
    }
}
