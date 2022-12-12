//
//  ProductECommerceList.swift
//  FitzeSeller
//
//  Created by Bryan Kenneth on 17/11/22.
//

import SwiftUI

struct ProductECommerceList: View {
    let screen = NSScreen.main?.visibleFrame
    @Binding var productLinks: [ProductLink]
    @Binding var siteName: [String]
    @Binding var siteLink: [String]
  
    
    func getBindingSiteName(forIndex index: Int) -> Binding<String> {
        return Binding<String>(get: { siteName[index] },
                               set: { siteName[index] = $0 })
    }
    
    func getBindingSiteLink(forIndex index: Int) -> Binding<String> {
        return Binding<String>(get: { siteLink[index] },
                               set: { siteLink[index] = $0 })
    }
    
    func getBinding(forIndex index: Int) -> Binding<ProductLink> {
        return Binding<ProductLink>(get: { productLinks[index] },
                               set: { productLinks[index] = $0 })
    }
    
    
    var body: some View {
        commerceReading{
            self.siteName.append("Tokopedia")
            self.siteLink.append("")
            self.productLinks.append(ProductLink(siteName: "", link: ""))
        }
        
        HStack(alignment: .firstTextBaseline, spacing: 50) {
            Text("Platform")
                .font(.custom("Sora-SemiBold", size: 24))
                .frame(maxWidth: 200, alignment: .leading)
            
            HStack(spacing: 40){
                Text("Link")
                    .font(.custom("Sora-SemiBold", size: 24))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(.clear)
                Text("   ")
                    .font(.custom("Sora-SemiBold", size: 24))
                    .frame(maxWidth: .infinity)
            }.frame(maxWidth: .infinity, alignment: .leading)
                .background(.clear)
            
        }   .frame(maxWidth: .infinity, alignment: .leading)
            .background(.clear)
        
        Divider()
        
        ForEach(0..<siteName.count, id: \.self) { index in
            ListPlatform(productLinks: getBinding(forIndex: index),
                         siteName: getBindingSiteName(forIndex: index),
                         siteLink: getBindingSiteLink(forIndex: index)) {
                self.siteName.remove(at: index)
                self.siteLink.remove(at: index)
                self.productLinks.remove(at: index)
            }
        }
    }
}

struct ListPlatform: View {
    let screen = NSScreen.main?.visibleFrame
    @Binding var productLinks: ProductLink
    @Binding var siteName: String
    @Binding var siteLink: String
    
    var removeAction: () -> Void
    
    let platforms = ["Tokopedia", "Shopee", "Lazada", "Blibli", "Others"]
    
    var body: some View {
        VStack(alignment: .leading){
            Spacer().frame(height: 8)
            HStack(spacing: 50){
                Picker("", selection: $siteName) {
                    ForEach(platforms, id: \.self) {
                        Text($0)
                    }
                    .font(.custom("Sora-SemiBold", size: 24))
                }
                .background(.clear)
                .labelsHidden()
                .frame(maxWidth: 200, maxHeight: .infinity)
                .onChange(of: siteName) { newValue in
                    productLinks = ProductLink(siteName: siteName, link: siteLink)
                }

                HStack(spacing: 40){
                    TextField("", text: $siteLink)
                        .placeholder(when: siteLink.isEmpty, text: "Enter Link"){}
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .onChange(of: siteLink) { newValue in
                            productLinks = ProductLink(siteName: siteName, link: siteLink)
                        }
                    
                    Button(action: removeAction) {
                        Image(systemName: "trash")
                            .font(.system(size: 24))
                            .foregroundColor(.red)
                            .padding(.horizontal)
                    }.buttonStyle(.plain)
                        
                }.frame(maxWidth: .infinity, alignment: .leading)
                
            }
            .textFieldStyle(RoundedTextFieldStyle())
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(.clear)
        }
    }
}

struct commerceReading: View {
    
    var addAction: () -> Void
    
    var body: some View {
        HStack{
            Text("E-Commerce Link")
                .font(.custom("Sora-Bold", size: 32))
            
            Spacer()
            
            Button(action: addAction) {
                Image(systemName: "plus")
                    .foregroundColor(Color.primaryColor)
                    .font(.system(size: 32, weight: .bold))
            }.buttonStyle(.plain)
        }.padding(.bottom, 67)
    }
}
