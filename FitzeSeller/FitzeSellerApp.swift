//
//  FitzeSellerApp.swift
//  FitzeSeller
//
//  Created by Bryan Kenneth on 09/11/22.
//

import SwiftUI

@main
struct FitzeSellerApp: App {
    
    @NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .preferredColorScheme(.light)
        }
        .windowToolbarStyle(.unifiedCompact(showsTitle: false))
    }
}

class AppDelegate: NSObject, NSApplicationDelegate {
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        
        let window = NSApplication.shared.windows.first!
//        window.titlebarAppearsTransparent = true
        
        window.backgroundColor = .white // Change to background color
        
        
//        window.standardWindowButton(.closeButton)!.isHidden = true
//        window.standardWindowButton(.miniaturizeButton)!.isHidden = true
//        window.standardWindowButton(.zoomButton)!.isHidden = true
        window.titlebarSeparatorStyle = .none
        window.center()
    }
}
