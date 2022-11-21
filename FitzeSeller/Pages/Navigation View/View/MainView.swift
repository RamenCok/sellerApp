//
//  NavigationView.swift
//  FitzeSeller
//
//  Created by Stephen Giovanni Saputra on 09/11/22.
//

import SwiftUI

class NavigationViewModel: ObservableObject {
    
    @Published var selectedTab = "Live"
}

struct MainView: View {
    
    @EnvironmentObject var vm: NavigationViewModel
    @EnvironmentObject var appState: AppState
    @EnvironmentObject var productListVM: ProductListVM
    
    @State private var currentSubview = AnyView(LoginView())
    @State private var showingSubview = false
    
    @State var products: [Product] = []
    
    var body: some View {
        StackNavigationView(currentSubview: $currentSubview, showingSubview: $showingSubview) {
            HStack(spacing: 0) {
                
                //MARK: - Tab Bar
                VStack(alignment: .leading, spacing: 0) {
                    
                    ProfileView()
                        .padding(.top, 100)
                        .padding(.bottom, 96)
                    
                    Group {
                        NavBarIcons(iconName: "wand.and.rays", tabBarName: "Live", selectedTab: $vm.selectedTab)
                        NavBarIcons(iconName: "rectangle.and.text.magnifyingglass", tabBarName: "On Review", selectedTab: $vm.selectedTab)
                        NavBarIcons(iconName: "exclamationmark.circle", tabBarName: "Need Action", selectedTab: $vm.selectedTab)
                        NavBarIcons(iconName: "archivebox", tabBarName: "Archived", selectedTab: $vm.selectedTab)
                        NavBarIcons(iconName: "folder", tabBarName: "Draft", selectedTab: $vm.selectedTab)
                    }
                    
                    Spacer(minLength: 200)
                    
                    VStack(spacing: 16) {
                        Button {
                            appState.switchScene = .productinput
//                            withAnimation(.easeOut(duration: 0.3)) {
//                                currentSubview = AnyView(AddProductView().environmentObject(appState))
//                                showingSubview = true
//                            }
                        } label: {
                            Text("Add a new product")
                                .font(.custom("Sora-Regular", size: 16))
                                .padding(.vertical, 16)
                                .padding(.horizontal, 80)
                                .frame(maxHeight: 54)
                                .foregroundColor(.white)
                                .background(Color.primaryButtonColor)
                                .cornerRadius(16)
                        }
                        .frame(maxWidth: 375, alignment: .center)
                        .buttonStyle(.plain)
                        
                        Button {
                            appState.switchScene = .login
                        } label: {
                            Text("Log Out")
                                .font(.custom("Sora-Regular", size: 16))
                                .underline()
                                .foregroundColor(.redColor)
                        }
                        .buttonStyle(.plain)
                    }
                        .padding(.bottom, 60)
                }
                .frame(maxHeight: .infinity)
                .background(Color.backgroundColor)
                .shadow(color: .gray.opacity(0.25), radius: 43, x: 0, y: 0)
                
                //MARK: - Tab Content
                ZStack {
                    
                    switch vm.selectedTab {
                        case "Live":
                        ProductListView(ListName: "Live", products: $products)
                            .onAppear { self.products = productListVM.products.filter { $0.tag == "Live" }}
                        case "On Review":
                            ProductListView(ListName: "On Review", products: $products)
                                .onAppear { self.products = productListVM.products.filter { $0.tag == "On Review" }}
                        case "Need Action":
                            ProductListView(ListName: "Need Action", products: $productListVM.products)
                                .onAppear { self.products = productListVM.products.filter { $0.tag == "Need Action" }}
                        case "Archived":
                            ProductListView(ListName: "Archived", products: $productListVM.products)
                                .onAppear { self.products = productListVM.products.filter { $0.tag == "Archived" }}
                        case "Draft":
                            ProductListView(ListName: "Draft", products: $productListVM.products)
                                .onAppear { self.products = productListVM.products.filter { $0.tag == "Draft" }}
                        default: Text("")
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .ignoresSafeArea(.all, edges: .all)
            .environmentObject(vm)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}

//
//struct NavigationView_Previews: PreviewProvider {
//    static var previews: some View {
//        NavigationView(products: Product.data)
//    }
//}
