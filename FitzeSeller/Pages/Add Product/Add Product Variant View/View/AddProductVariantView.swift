//
//  AddProductVariantView.swift
//  FitzeSeller
//
//  Created by Stephen Giovanni Saputra on 15/11/22.
//

import SwiftUI

struct AddProductVariantView: View {
    @Binding var colorsAsset: [ColorsAsset]
    @State var colors = [Color]()
    @State var imagesData = [NSData]()
    @State var isDisabled = [Bool]()
    
    let screen = NSScreen.main?.visibleFrame
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 37) {
            
            Text("Product Variant")
                .font(.custom("Sora-Bold", size: 32))
            
            ScrollView(.vertical, showsIndicators: true) {
                
                VStack(alignment: .leading, spacing: 30) {
                    
                    ForEach(0..<colors.count, id: \.self) { index in
                        
                        ReusableAddVariantView(color: getBindingColor(forIndex: index), imageData: getBindingImageData(forIndex: index), isDisabled: getBindingIsDisabledData(forIndex: index)) {
                            
                            self.colors.remove(at: index)
                            self.imagesData.remove(at: index)
                            self.isDisabled.remove(at: index)
                        }
                    }
                    
                    ClickToAddVariantButtonView(colors: $colors, imagesData: $imagesData, isDisabled: $isDisabled)
                }
            }
            
            Button {
                for i in 0..<colors.count {
                    print("DEBUG: \(colors[i].toHex() ?? "FFFFFF")")
                    let color = ColorsAsset(assetLink: "test", colors: colors[i].toHex() ?? "FFFFFF")
                    colorsAsset.append(color)
                }

//                for i in 0..<imagesData.count {
//                    NSOpenPanel.showSavePanel{ result1 in
//                        imagesData[i].write(to: result1, atomically: true)
//                    }
//                }
            } label: {
                Text("Pencet ini dulu!")
            }
//            .disabled(checkButton())
        }
        .padding(40)
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
    
    func getBindingIsDisabledData(forIndex index: Int) -> Binding<Bool> {
        return Binding<Bool>(get: {
            isDisabled[index]
        }, set: { isDisabled[index] = $0 })
    }
    
    func checkButton() -> Bool {
        
        let disabled = false
        
        if isDisabled.isEmpty {
            return true
        }
        
        for i in 0..<isDisabled.count {
            if isDisabled[i] == true {
                return true
                break
            }
        }
        
        return disabled
    }
}

//struct AddProductVariantView_Previews: PreviewProvider {
//    static var previews: some View {
//        AddProductVariantView()
//    }
//}
