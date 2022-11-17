//
//  AddProductVariantView.swift
//  FitzeSeller
//
//  Created by Stephen Giovanni Saputra on 15/11/22.
//

import SwiftUI

struct AddProductVariantView: View {
    
    @State var colors = [Color]()
    @State var imagesData = [NSData]()
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 37) {
            
            Text("Product Variant")
                .font(.custom("Sora-Bold", size: 32))
            
            ScrollView(.vertical, showsIndicators: true) {
                
                VStack(alignment: .leading, spacing: 30) {
                    
                    ForEach(0..<colors.count, id: \.self) { index in
                        
                        ReusableAddVariantView(color: getBindingColor(forIndex: index), imageData: getBindingImageData(forIndex: index)) {
                            
                            self.colors.remove(at: index)
                            self.imagesData.remove(at: index)
                        }
                    }
                    
                    ClickToAddVariantButtonView(colors: $colors, imagesData: $imagesData)
                }
            }
            
            Button {
                for i in 0..<colors.count {
                    print("DEBUG: \(colors[i].toHex() ?? "FFFFFF")")
                }
                
                for i in 0..<imagesData.count {
                    NSOpenPanel.showSavePanel{ result1 in
                        imagesData[i].write(to: result1, atomically: true)
                    }
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
    
    func getBindingImageData(forIndex index: Int) -> Binding<NSData> {
        return Binding<NSData>(get: {
            imagesData[index]
        }, set: { imagesData[index] = $0 })
    }
}

struct AddProductVariantView_Previews: PreviewProvider {
    static var previews: some View {
        AddProductVariantView()
    }
}
