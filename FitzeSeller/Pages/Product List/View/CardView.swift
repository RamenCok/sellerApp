//
//  CardView.swift
//  FitzeSeller
//
//  Created by Kevin Harijanto on 09/11/22.
//

import SwiftUI

struct CardView: View {
    let product: Product
    
    let productColors = Product.colorAsset.compactMap { $0["colors"] }.map { Color(hex: $0)! }
    
    var body: some View {
        VStack(spacing: 20) {
            Image("card")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 253, height: 253, alignment: .top)
            
            VStack(alignment: .leading, spacing: 14) {
                Text(product.productName)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .frame(height: 60, alignment: .topLeading)
                    .font(.custom("Sora-Bold", size: 20))
                    .foregroundColor(.black)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
                
                HStack {
                    if productColors.count > 3 {
                        Circle()
                            .foregroundColor(productColors[0])
                            .frame(width: 20, height: 20)
                        Circle()
                            .foregroundColor(productColors[1])
                            .frame(width: 20, height: 20)
                        Circle()
                            .foregroundColor(productColors[2])
                            .frame(width: 20, height: 20)
                        Text("+ \(productColors.count-3)")
                            .foregroundColor(.gray)
                            .font(.custom("Sora-Regular", size: 15))
                    }
                    else {
                        ForEach(productColors, id: \.self) { color in
                            Circle()
                                .foregroundColor(color)
                                .frame(width: 20, height: 20)
                        }
                    }
                }
            }
            .padding([.horizontal, .bottom], 20)
            .overlay {
                if product.tag == "On Review" {
                    Image(systemName:"rectangle.and.text.magnifyingglass")
                        .font(.system(size: 24, weight: .semibold))
                        .padding(20)
                        .foregroundColor(.orange)
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
                } else if product.tag == "Need Action" {
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
        .overlay(
            RoundedRectangle(cornerRadius: 32)
                .stroke(.gray.opacity(0.2))
        )
        .shadow(color: .gray.opacity(0.05), radius: 14, x: 0, y: 4)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(product: Product.data[0])
    }
}
