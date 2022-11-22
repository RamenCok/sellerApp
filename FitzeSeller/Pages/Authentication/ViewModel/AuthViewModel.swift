//
//  AuthViewModel.swift
//  FitzeSeller
//
//  Created by Kevin Harijanto on 09/11/22.
//

import Foundation
import Firebase
import FirebaseAuth
import FirebaseFirestore
import SwiftUI
import GoogleSignIn
import GoogleSignInSwift

class AuthViewModel: ObservableObject {
    
    // 1
    enum SignInState {
        case signedIn
        case signedOut
    }
    
    init() {
        print(Auth.auth().currentUser?.uid)
        if Auth.auth().currentUser != nil {
            getBrandData { snapshot, error in
                if let error = error {
                    print(error.localizedDescription)
                } else {
                    if let document = snapshot, document.exists {
                        let dictionary = document.data()
                        let brand = Brand(dictionary: dictionary ?? ["" : ""])
                        self.brand = brand
                        print("brand.brandName : \(brand.brandName)")
                    }
                }
            }
        }
    }

    private var db = Firestore.firestore()
    private var uid = Auth.auth().currentUser?.uid
    
    // 2
    @Published var state: SignInState = .signedOut
    @Published var brand: Brand = Brand(dictionary: ["" : ""])
    
    func loginWithApple() {
        print("Login with Apple")
    }
    
    func getBrandData(completions: @escaping (DocumentSnapshot?, Error?) -> Void) {
        db.collection("brand").document(Auth.auth().currentUser!.uid).getDocument(completion: completions)
    }
    
    func writeBrandData(documents: [String: Any],uids: String, completion: @escaping (Error?) -> Void) {
        db.collection("brand").document(uids).setData(documents, completion: completion)
    }
    
    func saveBrandData(documents: [String: Any],uids: String, completion: @escaping (Error?) -> Void) {
        db.collection("brand").document(uids).updateData(documents, completion: completion)
    }
    
    func loginWithEmail(email: String, password: String, completion: @escaping (AuthDataResult?, Error?) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password, completion: completion)
    }
    
    func logout(completion: @escaping () -> Void) {
        do {
            try Auth.auth().signOut()
            GIDSignIn.sharedInstance.disconnect()
            completion()
        } catch {
            print(error.localizedDescription)
        }
        
    }
    
    func signUpWithEmail(email: String, password: String, completion: @escaping (AuthDataResult?, Error?) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password, completion: completion)
    }
    
    func loginWithGoogle(completions: @escaping (AuthDataResult?, Error?) -> Void) {
        print("Login with Google")
        if GIDSignIn.sharedInstance.hasPreviousSignIn() {
            GIDSignIn.sharedInstance.restorePreviousSignIn { [unowned self] user, error in
                authenticateUser(for: user, with: error, completions: completions)
            }
          } else {
 
            guard let clientID = FirebaseApp.app()?.options.clientID else { return }

            let configuration = GIDConfiguration(clientID: clientID)
              
            GIDSignIn.sharedInstance.signIn(withPresenting: NSApp.windows.first!){ [unowned self] user, error in
                  authenticateUser(for: user?.user, with: error, completions: completions)
            }
              
    
          }
    }
    
    private func authenticateUser(for user: GIDGoogleUser?, with error: Error?, completions: @escaping (AuthDataResult?, Error?) -> Void) {
      // 1
      if let error = error {
        print(error.localizedDescription)
        return
      }
      
      // 2
        guard let authentication = user?.accessToken, let idToken = user?.idToken else { return }
      
        let credential = GoogleAuthProvider.credential(withIDToken: idToken.tokenString, accessToken: authentication.tokenString)
      
      // 3
      Auth.auth().signIn(with: credential, completion: completions)
    }

    
    func login() {
        print("Login")
    }
    
    func signUp() {
        print("Sign Up")
    }
}
