//
//  ContentView.swift
//  FitzeSeller
//
//  Created by Bryan Kenneth on 09/11/22.
//

import SwiftUI

// Define observable
class AppState: ObservableObject {
    enum CurrentView: Int {
        case login
        case main
    }
    
//    @AppStorage("scene") var switchScene = CurrentView.onboarding
    @Published var switchScene = CurrentView.login
}

struct ContentView: View {
    @StateObject var appState = AppState()
    @StateObject var viewModel = AuthViewModel()
    
    let transition: AnyTransition = .asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .leading))
    
    var body: some View {
        Group {
            switch (appState.switchScene) {
            case .login:
                SignUpLoginView()
                    .environmentObject(appState)
                    .environmentObject(viewModel)
                    .background(Background())
                    .frame(minWidth: 1728 / 1.5, minHeight: 1117 / 1.5)
                    .transition(transition)
            
            case .main:
                MainView()
                    .environmentObject(appState)
                    .background(Background())
                    .frame(minWidth: 1728 / 1.5, minHeight: 1117 / 1.5)
                    .transition(transition)
                
            }
        }
        .animation(.default, value: appState.switchScene)
    }
}
