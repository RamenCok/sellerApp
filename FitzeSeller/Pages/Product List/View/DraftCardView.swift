//
//  DraftCardView.swift
//  FitzeSeller
//
//  Created by Bryan Kenneth on 15/11/22.
//

import SwiftUI

struct DraftCardView: View {
    let product: Product
    
    var body: some View {
        HStack{
            VStack(alignment: .leading, spacing: 12, content: {
                Text(product.productName)
                    .font(.custom("Sora-Bold", size: 20))
                    .foregroundColor(.black)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text("Date Created: 28 October 2022")
                    .font(.custom("Sora-Regular", size: 20))
                    .foregroundColor(.lightGrey2)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }).padding(30)
                .background(.clear)
            Spacer()
            
        }
            
        .cornerRadius(32)
        .frame(height: 122)
        .overlay(
            RoundedRectangle(cornerRadius: 32)
                .stroke(Color.lightGrey2, lineWidth: 1)
        )
    }
}

//struct DraftCardView_Previews: PreviewProvider {
//    static var previews: some View {
//        DraftCardView()
//    }
//}
