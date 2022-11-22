//
//  ProductDetailView.swift
//  FitzeSeller
//
//  Created by Stephen Giovanni Saputra on 09/11/22.
//

import SwiftUI

struct ProductDetailView: View {
    
    let screen = NSScreen.main?.visibleFrame
    let product: ProductFetch
    
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
            
            vm.url = nil
            
            for i in 0..<product.colorsAsset.count {
                vm.asyncLoadModel(filename: product.colorsAsset.compactMap { ($0["assetLink"] as! String)}[i])
            }
        }
    }
}

//struct ProductDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        ProductDetailView()
//    }
//}
