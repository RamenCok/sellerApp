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
    
    @StateObject var vm = NavigationViewModel()
    
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
                    NavBarIcons(iconName: "archivebox", tabBarName: "Archive", selectedTab: $vm.selectedTab)
                    NavBarIcons(iconName: "folder", tabBarName: "Draft", selectedTab: $vm.selectedTab)
                }
                
                Spacer(minLength: 200)
                
                BottomButtonView()
                    .padding(.bottom, 60)
            }
            .frame(maxHeight: .infinity)
            .background(Color.white)
            .shadow(color: .gray.opacity(0.25), radius: 43, x: 0, y: 0)
            
            //MARK: - Tab Content
            ZStack {
                
                switch vm.selectedTab {
                    case "Live": Text("Live")
                    case "On Review": Text("On Review")
                    case "Need Action": Text("Need Action")
                    case "Archive": Text("Archive")
                    case "Draft": Text("Draft")
                    default: Text("")
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .ignoresSafeArea(.all, edges: .all)
        .background(
            
            // WILL BE REPLACED WITH A REUSABLE BACKGROUND
            Image("bg")
                .resizable()
                .aspectRatio(contentMode: .fill)
            // WILL BE REPLACED WITH A REUSABLE BACKGROUND
        )
        .environmentObject(vm)
    }
}


struct NavigationView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView()
    }
}
