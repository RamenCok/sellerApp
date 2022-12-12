//
//  ProductCommerceView.swift
//  FitzeSeller
//
//  Created by Bryan Kenneth on 17/11/22.
//

import SwiftUI

struct ProductCommerceView: View {
    let screen = NSScreen.main?.visibleFrame
    @Binding var productLinks: [ProductLink]
    @State var siteName = [String]()
    @State var siteLink = [String]()
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .center){
                ProductECommerceList(productLinks: $productLinks,
                                     siteName: $siteName,
                                     siteLink: $siteLink)
            }
            .frame(width: screen!.width * 0.5)
        }
        .padding()
    }
}
