//
//  SignUpLoginView.swift
//  FitzeSeller
//
//  Created by Kevin Harijanto on 09/11/22.
//

import SwiftUI

struct SignUpLoginView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    
    @State var isHoverApple = false
    @State var isHoverGoogle = false
    @State var isHoverLogin = false
    
    @State private var currentSubview = AnyView(LoginView())
    @State private var showingSubview = false
    
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
                        Button {
                            viewModel.loginWithApple()
                        } label: {
                            HStack {
                                Image("apple.logo")
                                    .resizable()
                                    .renderingMode(.template)
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 20, height: 20)
                                
                                Text("Continue with Apple")
                            }
                        }
                        .buttonStyle(SecondaryButton())
                        .scaleEffect(isHoverApple ? 1.05 : 1)
                        .animation(.spring(), value: isHoverApple)
                        .onHover { hover in
                            isHoverApple = hover
                        }
                        
                        Button {
                            viewModel.loginWithGoogle()
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
                        .frame(width: 462)
                    
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
                                showSubview(view: AnyView(LoginView()))
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

struct SignUpLoginView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpLoginView()
            .preferredColorScheme(.light)
    }
}
