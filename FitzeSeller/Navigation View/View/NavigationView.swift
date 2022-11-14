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

struct NavigationView: View {
    
    @EnvironmentObject var vm: NavigationViewModel
    
    @State var products: [Product]
    
    var body: some View {
        
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
                
                BottomButtonView()
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
                case "On Review":
                    ProductListView(ListName: "On Review", products: $products)
                case "Need Action":
                    ProductListView(ListName: "Need Action", products: $products)
                case "Archived":
                    ProductListView(ListName: "Archived", products: $products)
                case "Draft":
                    ProductListView(ListName: "Draft", products: $products)
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

//
//struct NavigationView_Previews: PreviewProvider {
//    static var previews: some View {
//        NavigationView(products: Product.data)
//    }
//}
