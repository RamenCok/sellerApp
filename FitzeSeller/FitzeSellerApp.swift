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
    
    init() {
        FirebaseApp.configure()
    }
    
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
    
    func applicationWillTerminate(_ notification: Notification) {
        
        let docsUrl = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first!
        let fileUrl = docsUrl.path
        
        if FileManager.default.fileExists(atPath: "\(fileUrl)/FitzeCache") {
            do {
                print("DEBUG: Deleting files")
                try FileManager.default.removeItem(at: URL(string: docsUrl.absoluteString + "/FitzeCache")!)
            } catch {
                print("DEBUG: Cannot delete file")
            }
        } else {
            print("DEBUG: GORONG ISO GOBLOK!!!")
        }
    }
}
    
