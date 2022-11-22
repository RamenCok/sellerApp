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
    
    @EnvironmentObject var vm: AssetVM
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 34) {
            
            if product.tag == "On Review" || product.tag == "Need Action" {
                ProductAlertView(tag: product.tag)
            }
           
            HStack(spacing: 65) {
                
                AssetView()
                
                ProductTextView(product: product)
            }
        }
        .padding(100)
        .onAppear {
            Task.init {
                await vm.asyncLoadModel(filename: "wetties")
            }
        }
    }
}

//struct ProductDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        ProductDetailView()
//    }
//}
