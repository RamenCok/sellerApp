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
    
    static func openImage(completion: @escaping (_ result: Result<NSImage, Error>) -> ()) {
        let panel = NSOpenPanel()
        panel.allowsMultipleSelection = false
        panel.canChooseFiles = true
        panel.canChooseDirectories = false
        panel.allowedFileTypes = ["jpg", "jpeg", "png", "heic"]
        panel.canChooseFiles = true
        panel.begin { (result) in
            if result == .OK,
               let url = panel.urls.first,
               let image = NSImage(contentsOf: url) {
                completion(.success(image))
            } else {
                completion(.failure(
                    NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "Failed to get file location"])
                ))
            }
        }
    }
}
