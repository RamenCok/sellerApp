//
//  SignUpLoginView.swift
//  FitzeSeller
//
//  Created by Kevin Harijanto on 09/11/22.
//

import SwiftUI
import CryptoKit
import FirebaseAuth
import AuthenticationServices

struct SignUpLoginView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    @EnvironmentObject var appState: AppState
    
    @State var isHoverApple = false
    @State var isHoverGoogle = false
    @State var isHoverLogin = false
    
    @State private var currentSubview = AnyView(LoginView())
    @State private var showingSubview = false
    
    @State var currentNonce:String?
    
    //Hashing function using CryptoKit
    func sha256(_ input: String) -> String {
        let inputData = Data(input.utf8)
        let hashedData = SHA256.hash(data: inputData)
        let hashString = hashedData.compactMap {
        return String(format: "%02x", $0)
        }.joined()

        return hashString
    }
    
    private func randomNonceString(length: Int = 32) -> String {
          precondition(length > 0)
          let charset: Array<Character> =
              Array("0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._")
          var result = ""
          var remainingLength = length

          while remainingLength > 0 {
            let randoms: [UInt8] = (0 ..< 16).map { _ in
              var random: UInt8 = 0
              let errorCode = SecRandomCopyBytes(kSecRandomDefault, 1, &random)
              if errorCode != errSecSuccess {
                fatalError("Unable to generate nonce. SecRandomCopyBytes failed with OSStatus \(errorCode)")
              }
              return random
            }

            randoms.forEach { random in
              if remainingLength == 0 {
                return
              }

              if random < charset.count {
                result.append(charset[Int(random)])
                remainingLength -= 1
              }
            }
          }

          return result
    }
    
    var body: some View {
        StackNavigationView(currentSubview: $currentSubview, showingSubview: $showingSubview) {
            VStack(alignment: .leading, spacing: 35) {
                VStack(alignment: .leading, spacing: 16) {
                    Capsule()
                        .foregroundColor(.tertiaryColor)
                        .frame(width: 97, height: 30)
                    
                    Text("Level up your \nselling journey")
                        .font(.custom("Sora-Bold", size: 48))
                }
                
                VStack(spacing: 30) {
                    VStack(spacing: 16) {
                        SignInWithAppleButton(
                            onRequest: { request in
                                let nonce = randomNonceString()
                                currentNonce = nonce
                                request.requestedScopes = [.fullName, .email]
                                request.nonce = sha256(nonce)
                            },
                            onCompletion: { result in
                                switch result {
                                    case .success(let authResults):
                                        switch authResults.credential {
                                            case let appleIDCredential as ASAuthorizationAppleIDCredential:
                                            
                                                    guard let nonce = currentNonce else {
                                                      fatalError("Invalid state: A login callback was received, but no login request was sent.")
                                                    }
                                                    guard let appleIDToken = appleIDCredential.identityToken else {
                                                        fatalError("Invalid state: A login callback was received, but no login request was sent.")
                                                    }
                                                    guard let idTokenString = String(data: appleIDToken, encoding: .utf8) else {
                                                      print("Unable to serialize token string from data: \(appleIDToken.debugDescription)")
                                                      return
                                                    }
                                                   
                                                    let credential = OAuthProvider.credential(withProviderID: "apple.com",idToken: idTokenString,rawNonce: nonce)
                                                    Auth.auth().signIn(with: credential) { (authResult, error) in
                                                        if let error = error {
                                                            print(error.localizedDescription)
                                                        } else {
                                                            print(authResult?.user.email)
                                                            viewModel.getBrandData { doc, error in
                                                                if let error = error {
                                                                    print(error.localizedDescription)
                                                                } else {
                                                                    if let document = doc, document.exists {
                                                                        let dictionary = document.data()
                                                                        let brand = Brand(dictionary: dictionary ?? ["" : ""])
                                                                        viewModel.brand = brand
                                                                        if brand.brandName == "" || brand.brandImage == "" {
                                                                            appState.switchScene = .personalize
                                                                        } else {
                                                                            viewModel.state = .signedIn
                                                                            appState.switchScene = .main
                                                                        }
                                                                    } else {
                                                                        let brand: [String: Any] = [
                                                                            "brandName" : "",
                                                                            "brandImage" : "",
                                                                            "productRef" : []
                                                                        ]
                                                                        viewModel.writeBrandData(documents: brand, uids: (authResult?.user.uid)!) { error in
                                                                            if let error = error {
                                                                                print(error.localizedDescription)
                                                                            } else {
                                                                                print("Write Data sucessful")
                                                                                appState.switchScene = .personalize
                                                                            }
                                                                        }
                                                                    }
                                                                }

                                                               
                                                            }
                                                            
                                                        }
                                                    }
                                            
                                                print("\(String(describing: Auth.auth().currentUser?.uid))")
                                        default:
                                            break
                                                    
                                                }
                                       default:
                                            break
                                    }
                            }
                        )
                        .scaleEffect(isHoverApple ? 1.05 : 1)
                        .animation(.linear(duration: 0.1), value: isHoverApple)
                        .onHover { hover in
                            isHoverApple = hover
                        }
                        
                        Button {
                            viewModel.loginWithGoogle(completions: {authResult, error in
                                if let error = error {
                                    print(error.localizedDescription)
                                } else {
                                    print(authResult?.user.email)
                                    viewModel.getBrandData { doc, error in
                                        if let error = error {
                                            print(error.localizedDescription)
                                        } else {
                                            if let document = doc, document.exists {
                                                let dictionary = document.data()
                                                let brand = Brand(dictionary: dictionary ?? ["" : ""])
                                                viewModel.brand = brand
                                                if brand.brandName == "" || brand.brandImage == "" {
                                                    appState.switchScene = .personalize
                                                } else {
                                                    viewModel.state = .signedIn
                                                    appState.switchScene = .main
                                                }
                                            } else {
                                                let brand: [String: Any] = [
                                                    "brandName" : "",
                                                    "brandImage" : "",
                                                    "productRef" : []
                                                ]
                                                viewModel.writeBrandData(documents: brand, uids: (authResult?.user.uid)!) { error in
                                                    if let error = error {
                                                        print(error.localizedDescription)
                                                    } else {
                                                        print("Write Data sucessful")
                                                        appState.switchScene = .personalize
                                                    }
                                                }
                                            }
                                        }

                                       
                                    }
                                    
                                }
                                
                            })
                        } label: {
                            HStack {
                                Image("google.logo")
                                    .resizable()
                                    .renderingMode(.template)
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 20, height: 20)
                                
                                Text("Continue with Google")
                            }
                        }
                        .buttonStyle(SecondaryButton())
                        .scaleEffect(isHoverGoogle ? 1.05 : 1)
                        .animation(.spring(), value: isHoverGoogle)
                        .onHover { hover in
                            isHoverGoogle = hover
                        }
                    }
                    
                    LabelledDivider(label: "or")
                        .font(.custom("Sora-Regular", size: 15))
                    
                    VStack(spacing: 25) {
                        Button {
                            showSubview(view: AnyView(LoginView()))
                        } label: {
                            Text("Log In")
                        }
                        .buttonStyle(PrimaryButton())
                        .scaleEffect(isHoverLogin ? 1.05 : 1)
                        .animation(.spring(), value: isHoverLogin)
                        .onHover { hover in
                            isHoverLogin = hover
                        }
                        
                        HStack {
                            Text("Don't have an account?")
                                .font(.custom("Sora-Regular", size: 20))
                            
                            Button {
                                showSubview(view: AnyView(SignUpView()))
                            } label: {
                                Text("Sign Up")
                                    .underline()
                                    .font(.custom("Sora-SemiBold", size: 20))
                            }
                            .buttonStyle(.plain)
                            .foregroundColor(.textColor)
                        }
                    }
                }
                .frame(width: 462)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
    private func showSubview(view: AnyView) {
        withAnimation(.easeOut(duration: 0.3)) {
            currentSubview = view
            showingSubview = true
        }
    }
}

//struct SignUpLoginView_Previews: PreviewProvider {
//    static var previews: some View {
//        SignUpLoginView()
//            .preferredColorScheme(.light)
//    }
//}
