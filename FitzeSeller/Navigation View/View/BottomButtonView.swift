//
//  BottomButtonView.swift
//  FitzeSeller
//
//  Created by Stephen Giovanni Saputra on 09/11/22.
//

import SwiftUI

struct BottomButtonView: View {
    
    @EnvironmentObject var appState: AppState
    
    var body: some View {
        
        VStack(spacing: 16) {
            
            Button {
                print("DEBUG: add new product")
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
    }
}

struct BottomButtonView_Previews: PreviewProvider {
    static var previews: some View {
        BottomButtonView()
    }
}
