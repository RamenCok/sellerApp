//
//  CardView.swift
//  FitzeSeller
//
//  Created by Kevin Harijanto on 09/11/22.
//

import SwiftUI

struct CardView: View {
    var productName: String
    var colors: [Color] = [.red, .blue, .green]
    
    var body: some View {
        VStack(spacing: 22) {
            Image("card")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 253, height: 253, alignment: .top)
            
            HStack(alignment: .bottom) {
                VStack(alignment: .leading, spacing: 14) {
                    Text(productName)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.custom("Sora-Bold", size: 20))
                        .foregroundColor(.textColor)
                        .multilineTextAlignment(.leading)
                        .lineLimit(2)
                    
                    HStack {
                        ForEach(colors, id: \.self) { color in
                            Circle()
                                .foregroundColor(color)
                                .frame(width: 20, height: 20)
                        }
                    }
                }
                .padding(.horizontal, 20)
                
                Image(systemName:"rectangle.and.text.magnifyingglass")
                    .font(.system(size: 24, weight: .semibold))
                    .padding(.horizontal,20)
                    .foregroundColor(.orange)
            }
        }
        .frame(width: 253, height: 389, alignment: .topLeading)
        .background(Color.backgroundColor)
        .cornerRadius(16)
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(.gray.opacity(0.2))
        )
        .shadow(color: .gray.opacity(0.05), radius: 14, x: 0, y: 4)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(productName: "Zip Through Borg Jacket")
    }
}
