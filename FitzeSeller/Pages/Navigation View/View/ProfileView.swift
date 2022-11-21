//
//  ProfileView.swift
//  FitzeSeller
//
//  Created by Stephen Giovanni Saputra on 09/11/22.
//

import SwiftUI

struct ProfileView: View {
    
    var body: some View {
        
        HStack(spacing: 20) {
            
            Circle()
                .aspectRatio(contentMode: .fit)
                .frame(height: 72)
                .foregroundColor(.pink)
            
            VStack(alignment: .leading) {
                
                Text("Love, Bonito")
                    .font(.custom("Sora-Regular", size: 20))
                
                Button {
                    
                } label: {
                    Text("Edit Profile")
                        .font(.custom("Sora-Regular", size: 16))
                        .underline()
                }
                .buttonStyle(.plain)
            }
            .foregroundColor(.textColor)
        }
        .padding(.leading, 32)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
