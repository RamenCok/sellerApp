//
//  NavBarIcons.swift
//  NavigationMacOS
//
//  Created by Stephen Giovanni Saputra on 08/11/22.
//

import SwiftUI

struct NavBarIcons: View {
    
    var iconName: String
    var tabBarName: String
    
    @Binding var selectedTab: String
    
    var body: some View {
        
        Button {
            withAnimation(.easeInOut(duration: 0.1)) {
                selectedTab = tabBarName
            }
        } label: {
            HStack(spacing: 25) {
                
                Capsule()
                    .frame(width: 5, height: 40)
                    .padding(.trailing, 16)
                    .opacity(selectedTab == tabBarName ? 1 : 0)
                
                Image(systemName: iconName)
                    .font(.custom("SF Pro Display", size: 24))
                    .frame(width: 40, height: 40)
                
                Text(tabBarName)
                    .font(.custom("Sora-Regular", size: 20))
            }
            .frame(width: 350, alignment: .leading)
            .padding(.vertical, 10)
            .contentShape(Rectangle())
        }
        .buttonStyle(.plain)
        .foregroundColor(selectedTab == tabBarName ? .primaryColor : .gray.opacity(0.5))
    }
}

struct NavBarIcons_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
