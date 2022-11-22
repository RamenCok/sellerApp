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
    
    @State var errorMsg = ""
    @State var presentAlert = false
    
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
                    if !email.isEmpty || !password.isEmpty || !confirmPassword.isEmpty {
                        if isValidEmail(email) && password.count >= 6 && confirmPassword == password {
                            viewModel.signUpWithEmail(email: email, password: password) { authData, error in
                                if let error = error {
                                    presentAlert = true
                                    errorMsg = error.localizedDescription
                                    print(error.localizedDescription)
                                } else {
                                    print("Debug: \(authData?.user.uid)")
                                    let brand: [String: Any] = [
                                        "brandName" : "",
                                        "brandImage" : "",
                                        "productRef" : [],
                                        "productRefSeller" : ["Xn9yE1hjH0Sck776kpyq"]
                                    ]
                                    viewModel.writeBrandData(documents: brand, uids: (authData?.user.uid)!) { error in
                                        if let error = error {
                                            print(error.localizedDescription)
                                        } else {
                                            appState.switchScene = .personalize
                                        }
                                    }
                                }
                            }
                        } else {
                            if !isValidEmail(email) {
                                presentAlert = true
                                errorMsg = "Email must have an email format"
                            } else if password.count < 6 {
                                presentAlert = true
                                errorMsg = "Password must contain 6 characters"
                            } else if confirmPassword != password {
                                presentAlert = true
                                errorMsg = "Password must be the same"
                            }
                        }
                    } else {
                        if email.isEmpty {
                            presentAlert = true
                            errorMsg = "Email can't be empty"
                        } else if password.isEmpty {
                            presentAlert = true
                            errorMsg = "Password can't be empty"
                        } else if confirmPassword.isEmpty {
                            presentAlert = true
                            errorMsg = "Password confirmation can't be empty"
                        }
                    }
                } label: {
                    Text("Create account")
                }
                .alert(errorMsg, isPresented: $presentAlert) {
                    Button("OK", role: .cancel) { }
                }
                .buttonStyle(PrimaryButton())
                .frame(width: 462)
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
    
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
}

//struct SignUpView_Previews: PreviewProvider {
//    static var previews: some View {
//        SignUpView()
//            .background(Background())
//            .frame(minWidth: 1728 / 1.5, minHeight: 1117 / 1.5)
//    }
//}
