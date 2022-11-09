//
//  LoginView.swift
//  FitzeSeller
//
//  Created by Kevin Harijanto on 09/11/22.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject var appState: AppState
    @EnvironmentObject var viewModel: AuthViewModel
    
    @State var email = ""
    @State var password = ""
    
    @State var isHoverLogin = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 60) {
            VStack(alignment: .leading, spacing: 16) {
                Capsule()
                    .foregroundColor(.tertiaryColor)
                    .frame(width: 97, height: 30)
                
                Text("Login to your \naccount")
                    .font(.custom("Sora-Bold", size: 48))
            }
            
            VStack(spacing: 78) {
                VStack(spacing: 15) {
                    TextField("Email",text: $email)
                        .textFieldStyle(RoundedTextFieldStyle())
                    
                    CustomSecureField(label: "Password", text: $password)
                        .textFieldStyle(RoundedTextFieldStyle())
                }.frame(width: 446)
                
                Button {
                    appState.switchScene = .main
                } label: {
                    Text("Log In")
                }
                .buttonStyle(PrimaryButton())
                .disabled(email.isEmpty || password.isEmpty)
                .opacity(email.isEmpty || password.isEmpty ? 0.6 : 1)
                .scaleEffect(!email.isEmpty && !password.isEmpty && isHoverLogin ? 1.05 : 1)
                .animation(.spring(), value: isHoverLogin)
                .onHover { hover in
                    isHoverLogin = hover
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
            .background(Background())
            .frame(minWidth: 1728 / 1.5, minHeight: 1117 / 1.5)
    }
}
