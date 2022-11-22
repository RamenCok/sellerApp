//
//  ContentView.swift
//  FitzeSeller
//
//  Created by Bryan Kenneth on 09/11/22.
//

import SwiftUI
import FirebaseAuth
class AppState: ObservableObject {
    enum CurrentView: Int {
        case login
        case personalize
        case main
        case productinput
    }
    
    // Store App State with AppStorage
//     @AppStorage("scene") var switchScene = CurrentView.login
    @Published var switchScene = Auth.auth().currentUser == nil ? CurrentView.login : CurrentView.main
}

struct ContentView: View {
    @StateObject var appState = AppState()
    @StateObject var viewModel = AuthViewModel()
    @StateObject var navViewModel = NavigationViewModel()
    @StateObject var listViewVM = ProductListVM()
    @StateObject var assetVM = AssetVM()
    
    @StateObject var addProductViewModel = AddProductViewModel()
    let transition: AnyTransition = .asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .trailing))
    
    let backTransition: AnyTransition = .asymmetric(insertion: .move(edge: .leading), removal: .move(edge: .leading))
    
    var body: some View {
        // Inject viewmodel as environment object here
        // All view must be framed with maxWidth and maxHeight as Infinity
        Group {
            switch (appState.switchScene) {
            case .login:
                SignUpLoginView()
                    .environmentObject(appState)
                    .environmentObject(viewModel)
                    .background(Background())
                    .frame(minWidth: 1600 / 1.2, minHeight: 1000 / 1.2)
                    .transition(transition)
            
            case .personalize:
                PersonalizeBrandView()
                    .environmentObject(appState)
                    .environmentObject(viewModel)
                    .background(Background())
                    .frame(minWidth: 1600 / 1.2, minHeight: 1000 / 1.2)
                    .transition(transition)
            
            case .main:
                MainView()
                    .environmentObject(appState)
                    .environmentObject(navViewModel)
                    .environmentObject(viewModel)
                    .environmentObject(listViewVM)
                    .environmentObject(assetVM)
                    .background(Background())
                    .frame(minWidth: 1600 / 1.2, minHeight: 1000 / 1.2)
                    .transition(backTransition)
                
            case .productinput:
                AddProductView()
                    .environmentObject(appState)
                    .environmentObject(addProductViewModel)
                    .background(Background())
                    .frame(minWidth: 1600 / 1.2, minHeight: 1000 / 1.2)
                    .transition(transition)
                    
            }
        }
        .animation(.default, value: appState.switchScene)
    }
}
