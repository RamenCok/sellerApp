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
    public static let tertiaryColor = Color("tertiaryColor")
    public static let textColor = Color("textColor")
    public static let textFieldBG = Color("textFieldBG")
    public static let textFieldColor = Color("textFieldColor")
}

extension View {
    func placeholder<Content: View>(
        when shouldShow: Bool,
        text title: String,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content) -> some View {

        ZStack(alignment: alignment) {
            self
            Text("\(title)")
                .opacity(shouldShow ? 1 : 0)
                .padding(20)
                .font(.custom("Sora-Regular", size: 16))
                .foregroundColor(.textFieldColor.opacity(0.3))
        }
    }
}
