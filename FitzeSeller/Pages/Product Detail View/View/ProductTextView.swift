//
//  ProductTextView.swift
//  FitzeSeller
//
//  Created by Stephen Giovanni Saputra on 10/11/22.
//

import SwiftUI

struct ProductTextView: View {
    
    let product: Product
    
    var brandName: String = ""
    var productDesc: String = ""
    
    var primaryButtonText: String = ""
    var secondaryButtonText: String = ""
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 0) {
            
            // MARK: - Product Name and Brand Name
            Group {
                Text("Joyce Boutique")
                    .foregroundColor(.gray.opacity(0.5))
                    .font(.custom("Sora-Semibold", size: 24))
                    .padding(.bottom, 10)
                
                Text("\(product.productName)")
                    .foregroundColor(.textColor)
                    .font(.custom("Sora-Bold", size: 40))
                    .lineLimit(2)
                    .padding(.bottom, 45)
            }
            
            // MARK: - Colors
            RadioButtonGroup(colors: product.productColors)
            .padding(.bottom, 25)
            
            // MARK: - Product Description
            ScrollView {
                Text("Dreamy frills to brighten up your day. Crafted from sweat-wicking textured cotton, this mini dress features an A-line silhouette, V-neckline, and flared sleves. Comes with functional side pockets and zipper on the side.\n\nA-line silhouette, V-neckline, and flared sleves. Comes with functional side Dreamy frills to brighten up your day. Crafted from sweat-wicking textured cotton, this mini dress features an A-line silhouette, V-neckline, and flared sleves. Comes with functional side pockets and zipper on the side.\n\nA-line silhouette, V-neckline, and flared sleves. Comes with functional sideDreamy frills to brighten up your day. Crafted from sweat-wicking textured cotton, this mini dress features an A-line silhouette, V-neckline, and flared sleves. Comes with functional side pockets and zipper on the side.\n\nA-line silhouette, V-neckline, and flared sleves. Comes with functional sideDreamy frills to brighten up your day. Crafted from sweat-wicking textured cotton, this mini dress features an A-line silhouette, V-neckline, and flared sleves. Comes with functional side pockets and zipper on the side.\n\nA-line silhouette, V-neckline, and flared sleves. Comes with functional sideDreamy frills to brighten up your day. Crafted from sweat-wicking textured cotton, this mini dress features an A-line silhouette, V-neckline, and flared sleves. Comes with functional side pockets and zipper on the side.\n\nA-line silhouette, V-neckline, and flared sleves. Comes with functional sideDreamy frills to brighten up your day. Crafted from sweat-wicking textured cotton, this mini dress features an A-line silhouette, V-neckline, and flared sleves. Comes with functional side pockets and zipper on the side.\n\nA-line silhouette, V-neckline, and flared sleves. Comes with functional sideDreamy frills to brighten up your day. Crafted from sweat-wicking textured cotton, this mini dress features an A-line silhouette, V-neckline, and flared sleves. Comes with functional side pockets and zipper on the side.\n\nA-line silhouette, V-neckline, and flared sleves. Comes with functional side")
                    .font(.custom("Sora-Regular", size: 16))
                    .foregroundColor(.textColor)
            }
            .frame(maxHeight: 268, alignment: .center)
            .padding(.bottom, 47)
            
            // MARK: - Buttons
            HStack(spacing: 20) {
                
                Button {
                    print("COK")
                } label: {
                    Text("Edit Product")
                }
                .buttonStyle(SecondaryButton())
                
                Button {
                    
                } label: {
                    if product.tag == "Archived" {
                        Text("Publish to Live")
                    } else {
                        Text("Archive")
                    }
                }
                .buttonStyle(PrimaryButton())
            }
            .buttonStyle(.plain)
        }
    }
}

//struct ProductTextView_Previews: PreviewProvider {
//    static var previews: some View {
//        ProductTextView()
//    }
//}
