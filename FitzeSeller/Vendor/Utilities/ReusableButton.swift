//
//  ReusableButton.swift
//  FitzeSeller
//
//  Created by Kevin Harijanto on 09/11/22.
//

import SwiftUI

struct PrimaryButton: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .padding()
            .frame(maxWidth: .infinity)
            .font(.custom("Sora-Regular", size: 16))
            .foregroundColor(.white)
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color.primaryButtonColor)
            )
    }
}

struct SecondaryButton: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .padding()
            .frame(maxWidth: .infinity)
            .font(.custom("Sora-Regular", size: 16))
            .foregroundColor(.primaryColor)
            .overlay{
                RoundedRectangle(cornerRadius: 16)
                    .stroke(Color.primaryColor, lineWidth: 2)
            }
            .background(
                Color.backgroundColor
            )
            
    }
}
