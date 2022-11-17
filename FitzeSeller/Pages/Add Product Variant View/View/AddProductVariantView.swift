//
//  AddProductVariantView.swift
//  FitzeSeller
//
//  Created by Stephen Giovanni Saputra on 15/11/22.
//

import SwiftUI

struct AddProductVariantView: View {
    
    @State var colors = [Color]()
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 37) {
            
            Text("Product Variant")
                .font(.custom("Sora-Bold", size: 32))
            
            ScrollView(.vertical, showsIndicators: true) {
                
                VStack(spacing: 30) {
                    
                    ForEach(0..<colors.count, id: \.self) { color in
                        
                        ReusableAddVariantView(color: getBindingColor(forIndex: color)) {
                            
                        }
                    }
                    
                    ClickToAddVariantButtonView(colors: $colors)
                }
            }
            
            Button {
                for i in 0..<colors.count {
                    print("DEBUG: \(colors[i].toHex() ?? "FFFFFF")")
                }
            } label: {
                Text("PRINT COLOR COKKKKKK")
            }

        }
        .padding(40)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Background())
    }
    
    func getBindingColor(forIndex index: Int) -> Binding<Color> {
        return Binding<Color>(get: {
            colors[index]
        }, set: { colors[index] = $0 })
    }
}

struct AddProductVariantView_Previews: PreviewProvider {
    static var previews: some View {
        AddProductVariantView()
    }
}
