//
//  OpenPanel.swift
//  FitzeSeller
//
//  Created by Bryan Kenneth on 17/11/22.
//

import Foundation
import SwiftUI

extension NSOpenPanel {
    
    static func openImage(completion: @escaping (_ result: Result<NSData, Error>) -> ()) {
        let panel = NSOpenPanel()
        panel.allowsMultipleSelection = false
        panel.canChooseFiles = true
        panel.canChooseDirectories = false
        panel.allowedContentTypes = [.jpeg, .png]
        panel.canChooseFiles = true
        
        panel.begin { result in
            if result == .OK, let url = panel.urls.first, let data = NSData(contentsOf: url) {
                completion(.success(data))
            } else {
                completion(.failure(
                    NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "Failed to get file location"])
                ))
            }
        }
    }
    
    static func showSavePanel(completion: @escaping (_ result: URL) -> ())  {
        
        let savePanel = NSSavePanel()
//        savePanel.allowedContentTypes = [.zip]
        savePanel.canCreateDirectories = true
        savePanel.isExtensionHidden = false
        savePanel.allowsOtherFileTypes = false
        savePanel.title = "Save your text"
        savePanel.message = "Choose a folder and a name to store your text."
        savePanel.nameFieldLabel = "File name:"
        let response = savePanel.runModal()
        completion(savePanel.url!)
    }
}
