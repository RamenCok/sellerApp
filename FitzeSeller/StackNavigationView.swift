//
//  StackNavigationView.swift
//  FitzeSeller
//
//  Created by Kevin Harijanto on 09/11/22.
//

import SwiftUI

struct StackNavigationView<RootContent>: View where RootContent: View {
    
    @Binding var currentSubview: AnyView
    @Binding var showingSubview: Bool
    
    let rootView: () -> RootContent
    
    init(currentSubview: Binding<AnyView>, showingSubview: Binding<Bool>,
         @ViewBuilder rootView: @escaping () -> RootContent) {
        self._currentSubview = currentSubview
        self._showingSubview = showingSubview
        self.rootView = rootView
    }
    
    var body: some View {
        VStack {
            if !showingSubview {
                rootView()
            } else {
                StackNavigationSubview(isVisible: $showingSubview) {
                    currentSubview
            }
            .transition(.move(edge: .trailing))
            .transition(.opacity)
            }
        }
    }
    
    
    private struct StackNavigationSubview<Content>: View where Content: View {
        @Binding var isVisible: Bool
        let contentView: () -> Content
        
        var body: some View {
            // Overlay with Back Button
            ZStack {
                Button {
                    withAnimation(.easeOut(duration: 0.3)) {
                        isVisible = false
                    }
                } label: {
                    Image(systemName: "chevron.left")
                        .font(.system(size: 36))
                        .foregroundColor(.primaryColor)
                }
                .buttonStyle(.plain)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                .padding(40)
                
                contentView() // subview
            }
        }
    }
}

