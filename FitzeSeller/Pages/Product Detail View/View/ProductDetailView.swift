//
//  ProductDetailView.swift
//  FitzeSeller
//
//  Created by Stephen Giovanni Saputra on 09/11/22.
//

import SwiftUI

struct ProductDetailView: View {
    
    let screen = NSScreen.main?.visibleFrame
    let product: Product
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 34) {
            
            if product.tag == "On Review" || product.tag == "Need Action" {
                ProductAlertView(tag: product.tag)
            }
           
            HStack(spacing: 65) {
                Image("test")
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: 476, maxHeight: 680, alignment: .center)
                    .background(Color.white)
                    .cornerRadius(32)
                    .overlay {
                        RoundedRectangle(cornerRadius: 32)
                            .stroke(lineWidth: 1)
                            .foregroundColor(.gray.opacity(0.15))
                    }
                    .shadow(color: .gray.opacity(0.1), radius: 46, x: 0, y: 4)
                
                ProductTextView(product: product)
            }
        }
        .padding(100)
    }
}

//struct ProductDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        ProductDetailView()
//    }
//}
