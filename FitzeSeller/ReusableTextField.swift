//
//  ReusableTextField.swift
//  FitzeSeller
//
//  Created by Kevin Harijanto on 09/11/22.
//

import SwiftUI

struct RoundedTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .textFieldStyle(.plain)
            .padding(.vertical)
            .padding(.horizontal, 24)
            .font(.custom("Sora-Regular", size: 16))
            .foregroundColor(.textColor)
            .background(
                Color.textFieldBG
            )
            .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}

struct CustomSecureField : View {
    var label : String
    @Binding var text : String
    @State var isEditing = false
    @State var isHidden = true
    var body : some View {
        let showPasswordBinding = Binding<String> {
            self.text
        } set: {
            self.text = $0
        }
        let hidePasswordBinding = Binding<String> {
            String.init(repeating: "●", count: self.text.count)
        } set: { newValue in
            if(newValue.count < self.text.count) {
                self.text = ""
            } else {
                self.text.append(contentsOf: newValue.suffix(newValue.count - self.text.count) )
            }
        }
        
        return ZStack(alignment: .trailing) {
            TextField(
                label,
                text: isHidden ? hidePasswordBinding : showPasswordBinding,
                onEditingChanged: { editingChanged in
                    isEditing = editingChanged
                }
            )
            
            Image(systemName: isHidden ? "eye.slash" : "eye")
                .frame(width: 60, height: 60)
                .onTapGesture { isHidden.toggle() }
        }
    }
}

