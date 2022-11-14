//
//  CardView.swift
//  FitzeSeller
//
//  Created by Kevin Harijanto on 09/11/22.
//

import SwiftUI

struct CardView: View {
    let card: Card
    
    var body: some View {
        VStack(spacing: 20) {
            Image("card")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 253, height: 253, alignment: .top)
            
            VStack(alignment: .leading, spacing: 14) {
                Text(card.productName)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .frame(height: 60, alignment: .topLeading)
                    .font(.custom("Sora-Bold", size: 20))
                    .foregroundColor(.primaryColorOnly)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
                
                HStack {
                    if card.productColors.count > 3 {
                        Circle()
                            .foregroundColor(card.productColors[0])
                            .frame(width: 20, height: 20)
                        Circle()
                            .foregroundColor(card.productColors[1])
                            .frame(width: 20, height: 20)
                        Circle()
                            .foregroundColor(card.productColors[2])
                            .frame(width: 20, height: 20)
                        Text("+ \(card.productColors.count-3)")
                            .foregroundColor(.gray)
                            .font(.custom("Sora-Regular", size: 15))
                    }
                    else {
                        ForEach(card.productColors, id: \.self) { color in
                            Circle()
                                .foregroundColor(color)
                                .frame(width: 20, height: 20)
                        }
                    }
                }
            }
            .padding([.horizontal, .bottom], 20)
            .overlay {
                if card.tag == "On Review" {
                    Image(systemName:"rectangle.and.text.magnifyingglass")
                        .font(.system(size: 24, weight: .semibold))
                        .padding(20)
                        .foregroundColor(.orange)
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
                } else if card.tag == "Need Action" {
                    Image(systemName:"exclamationmark.circle")
                        .font(.system(size: 24, weight: .semibold))
                        .padding(20)
                        .foregroundColor(.red)
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
                }
            }
        }
        .frame(width: 253, alignment: .topLeading)
        .background(Color.white)
        .cornerRadius(32)
//        .overlay(
//            RoundedRectangle(cornerRadius: 16)
//                .stroke(.gray.opacity(0.2))
//        )
//        .shadow(color: .gray.opacity(0.05), radius: 14, x: 0, y: 4)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(card: Card.data[2])
    }
}
