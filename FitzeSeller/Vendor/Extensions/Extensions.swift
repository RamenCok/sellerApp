//
//  Extensions.swift
//  FitzeSeller
//
//  Created by Kevin Harijanto on 09/11/22.
//

import SwiftUI

extension Color {
    
    public static let backgroundColor = Color("backgroundColor")
    public static let disabledColor = Color("disabledColor")
    public static let disabledColorButtonText = Color("disabledColorButtonText")
    public static let primaryButtonColor = Color("primaryButtonColor")
    public static let primaryColor = Color("primaryColor")
    public static let primaryColorOnly = Color("primaryColorOnly")
    public static let tertiaryColor = Color("tertiaryColor")
    public static let textColor = Color("textColor")
    public static let textFieldBG = Color("textFieldBG")
    public static let textFieldColor = Color("textFieldColor")
    public static let redColor = Color("redColor")
    public static let lightGrey2 = Color("lightGrey2")
    
    func toHex() -> String? {
        
        let uic = NSColor(self)
        guard let components = uic.cgColor.components, components.count >= 3 else {
            return nil
        }
        let r = Float(components[0])
        let g = Float(components[1])
        let b = Float(components[2])
        var a = Float(1.0)

        if components.count >= 4 {
            a = Float(components[3])
        }

        if a != Float(1.0) {
            return String(format: "%02lX%02lX%02lX%02lX", lroundf(r * 255), lroundf(g * 255), lroundf(b * 255), lroundf(a * 255))
        } else {
            return String(format: "%02lX%02lX%02lX", lroundf(r * 255), lroundf(g * 255), lroundf(b * 255))
        }
    }
}

extension View {
    // Custom placeholder for Textfield, so that it works in dark mode
    func placeholder<Content: View>(
        when shouldShow: Bool,
        text title: String,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content) -> some View {

        ZStack(alignment: alignment) {
            self
            Text("\(title)")
                .opacity(shouldShow ? 1 : 0)
                .padding(.leading, 24)
                .font(.custom("Sora-Regular", size: 16))
                .foregroundColor(.textFieldColor.opacity(0.3))
                .allowsHitTesting(false)
        }
        .background(Color.clear)
    }
}

extension NSOpenPanel {
    
    static func openImage(completion: @escaping (_ result: Result<NSData, Error>) -> ()) {
        let panel = NSOpenPanel()
        panel.allowsMultipleSelection = false
        panel.canChooseFiles = true
        panel.canChooseDirectories = false
        panel.allowedContentTypes = [.zip]
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
        savePanel.allowedContentTypes = [.zip]
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
