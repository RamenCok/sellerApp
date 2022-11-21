//
//  ProductCommerceView.swift
//  FitzeSeller
//
//  Created by Bryan Kenneth on 17/11/22.
//

import SwiftUI

struct ProductCommerceView: View {
    let screen = NSScreen.main?.visibleFrame

    
    @State var siteName = [""]
    @State var siteLink = [""]    
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .center){
                ProductECommerceList(siteName: $siteName, siteLink: $siteLink)
                
                
                Button {
                    var dimension = [[String: Any]]()
                    
                    for i in 0..<siteName.count {
                        let zipDimension = ["siteName": siteName[i], "link": siteLink[i]]
                        dimension.append(zipDimension)
                    }
                
                    
//                    print(final)
                    
                } label: {
                    Text("Zipped")
                }

            }
            .frame(width: screen!.width * 0.5)
        }
        .padding()
    }
}

struct ProductCommerceView_Previews: PreviewProvider {
    static var previews: some View {
        ProductCommerceView()
    }
}
