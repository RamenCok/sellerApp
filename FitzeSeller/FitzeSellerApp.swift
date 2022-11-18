//
//  FitzeSellerApp.swift
//  FitzeSeller
//
//  Created by Bryan Kenneth on 09/11/22.
//

import SwiftUI
import FirebaseCore

@main
struct FitzeSellerApp: App {
    
    @NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .preferredColorScheme(.light)
        }
        .windowToolbarStyle(.unifiedCompact(showsTitle: false))
        .commands { SidebarCommands() }
    }
}

class AppDelegate: NSObject, NSApplicationDelegate {
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        
        let window = NSApplication.shared.windows.first!
        window.titlebarAppearsTransparent = true
        FirebaseApp.configure()
        
        window.backgroundColor = NSColor(Color.backgroundColor) // Change to background color
//        window.aspectRatio = NSSize(width: 16, height: 10)

//        window.standardWindowButton(.closeButton)!.isHidden = true
//        window.standardWindowButton(.miniaturizeButton)!.isHidden = true
//        window.standardWindowButton(.zoomButton)!.isHidden = true
        window.titlebarSeparatorStyle = .none
        window.center()
    }
}
    
