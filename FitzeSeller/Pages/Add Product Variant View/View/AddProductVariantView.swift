//
//  AddProductVariantView.swift
//  FitzeSeller
//
//  Created by Stephen Giovanni Saputra on 15/11/22.
//

import SwiftUI

struct AddProductVariantView: View {
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 37) {
            
            Text("Product Variant")
                .font(.custom("Sora-Bold", size: 32))
            
            ScrollView(.vertical, showsIndicators: true) {
                
                ClickToAddVariantButtonView()
            }
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Background())
    }
}

struct AddProductVariantView_Previews: PreviewProvider {
    static var previews: some View {
        AddProductVariantView()
    }
}
