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
    @State var errorMsg = ""
    @State var presentAlert = false
    
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
                    TextField("",text: $email)
                        .textFieldStyle(RoundedTextFieldStyle())
                        .placeholder(when: email.isEmpty, text: "Email") {}
                    
                    CustomSecureField(label: "", text: $password)
                        .textFieldStyle(RoundedTextFieldStyle())
                        .placeholder(when: password.isEmpty, text: "Password") {}
                    
                }.frame(width: 446)
                
                Button {
                    print(email)
                    
                    viewModel.loginWithEmail(email: email, password: password) { authData, error in
                        if let error = error {
                            errorMsg = error.localizedDescription
                            presentAlert = true
                        } else {
                            viewModel.getBrandData { doc, error in
                                if let error = error {
                                    presentAlert = true
                                    errorMsg = error.localizedDescription
                                } else {
                                    print("Login Successful")
                                    if let document = doc, document.exists {
                                        let dictionary = document.data()
                                        let brand = Brand(dictionary: dictionary ?? ["" : ""])
                                        viewModel.brand = brand
                                        if brand.brandName == "" {
                                            appState.switchScene = .personalize
                                        } else {
                                            viewModel.state = .signedIn
                                            appState.switchScene = .main
                                        }
                                    }
                                }

                               
                            }
                        }
                    }
//                    appState.switchScene = .main
                } label: {
                    Text("Log In")
                }
                .buttonStyle(PrimaryButton())
                .frame(width: 462)
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
//
//struct LoginView_Previews: PreviewProvider {
//    static var previews: some View {
//        LoginView()
//            .background(Background())
//            .frame(minWidth: 1728 / 1.5, minHeight: 1117 / 1.5)
//    }
//}
