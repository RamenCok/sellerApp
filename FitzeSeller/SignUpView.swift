//
//  SignUpView.swift
//  FitzeSeller
//
//  Created by Kevin Harijanto on 09/11/22.
//

import SwiftUI

struct SignUpView: View {
    @EnvironmentObject var appState: AppState
    @EnvironmentObject var viewModel: AuthViewModel
    
    @State var email = ""
    @State var password = ""
    @State var confirmPassword = ""
    
    @State var isHoverCreateAccount = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 60) {
            VStack(alignment: .leading, spacing: 16) {
                Capsule()
                    .foregroundColor(.tertiaryColor)
                    .frame(width: 97, height: 30)
                
                Text("Create your \naccount")
                    .font(.custom("Sora-Bold", size: 48))
            }
            
            VStack(spacing: 78) {
                VStack(spacing: 15) {
                    TextField("",text: $email)
                        .textFieldStyle(RoundedTextFieldStyle())
                        .placeholder(when: email.isEmpty, text: "Email") {}
                    
                    CustomSecureField(label: "", text: $password)
                        .textFieldStyle(RoundedTextFieldStyle())
                        .placeholder(when: password.isEmpty, text: "Password") {}
                    
                    CustomSecureField(label: "", text: $confirmPassword)
                        .textFieldStyle(RoundedTextFieldStyle())
                        .placeholder(when: confirmPassword.isEmpty, text: "Confirm Password") {}
                }.frame(width: 446)
                
                Button {
                    
                } label: {
                    Text("Create account")
                }
                .buttonStyle(PrimaryButton())
                .disabled(email.isEmpty || password.isEmpty || confirmPassword.isEmpty)
                .opacity(email.isEmpty || password.isEmpty || confirmPassword.isEmpty ? 0.6 : 1)
                .scaleEffect(!email.isEmpty && !password.isEmpty && !confirmPassword.isEmpty && isHoverCreateAccount ? 1.05 : 1)
                .animation(.spring(), value: isHoverCreateAccount)
                .onHover { hover in
                    isHoverCreateAccount = hover
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
            .background(Background())
            .frame(minWidth: 1728 / 1.5, minHeight: 1117 / 1.5)
    }
}
