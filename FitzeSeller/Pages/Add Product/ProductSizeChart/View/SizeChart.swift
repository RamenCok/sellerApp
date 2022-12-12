//
//  SizeChart.swift
//  FitzeSeller
//
//  Created by Kevin Harijanto on 15/11/22.
//

import SwiftUI
import Combine

struct SkillListEditor: View {
    let screen = NSScreen.main?.visibleFrame
    @Binding var productSizeChart: [ProductSizeChart]
    @Binding var sizes: [String]
    @Binding var chest: [String]
    @Binding var waist: [String]
    @Binding var height: [String]
    
    func getBindingSizes(forIndex index: Int) -> Binding<String> {
        return Binding<String>(get: { sizes[index] },
                               set: { sizes[index] = $0 })
    }
    
    func getBindingChest(forIndex index: Int) -> Binding<String> {
        return Binding<String>(get: { chest[index] },
                               set: { chest[index] = $0 })
    }
    
    func getBindingWaist(forIndex index: Int) -> Binding<String> {
        return Binding<String>(get: { waist[index] },
                               set: { waist[index] = $0 })
    }
    
    func getBindingHeight(forIndex index: Int) -> Binding<String> {
        return Binding<String>(get: { height[index] },
                               set: { height[index] = $0 })
    }
    
    func getBinding(forIndex index: Int) -> Binding<ProductSizeChart> {
        return Binding<ProductSizeChart>(get: { productSizeChart[index] },
                               set: { productSizeChart[index] = $0 })
    }
    
    var body: some View {
        SizeChartHeading{
            self.sizes.append("XS")
            self.chest.append("")
            self.waist.append("")
            self.height.append("")
            self.productSizeChart.append(ProductSizeChart(sizeName: 0, sizeDimension: [:]))
        }
        
        HStack(alignment: .firstTextBaseline, spacing: 50) {
            Text("Size")
                .font(.custom("Sora-SemiBold", size: 24))
                .frame(maxWidth: 200, alignment: .leading)
            HStack(spacing: 40){
                Text("Bust")
                    .font(.custom("Sora-SemiBold", size: 24))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(.clear)
                Text("Waist")
                    .font(.custom("Sora-SemiBold", size: 24))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(.clear)
                Text("Height")
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
        
        ForEach(0..<sizes.count, id: \.self) { index in
            ListItem(productSizeChart: getBinding(forIndex: index),
                     size: getBindingSizes(forIndex: index),
                     chest: getBindingChest(forIndex: index),
                     waist: getBindingWaist(forIndex: index),
                     height: getBindingHeight(forIndex: index)) {
                self.sizes.remove(at: index)
                self.chest.remove(at: index)
                self.waist.remove(at: index)
                self.height.remove(at: index)
                self.productSizeChart.remove(at: index)
            }
        }
    }
}

struct ListItem: View {
    let screen = NSScreen.main?.visibleFrame
    @Binding var productSizeChart: ProductSizeChart
    @Binding var size: String
    @Binding var chest: String
    @Binding var waist: String
    @Binding var height: String
    var removeAction: () -> Void
    
    let sizes = ["XS", "S", "M", "L", "XL"]
    
    var body: some View {
        VStack(alignment: .leading){
            Spacer().frame(height: 8)
            HStack(spacing: 50){
                Picker("", selection: $size) {
                    ForEach(sizes, id: \.self) {
                        Text($0)
                    }.font(.custom("Sora-SemiBold", size: 24))
                }
                .background(.clear)
                .labelsHidden()
                .frame(maxWidth: 200, maxHeight: .infinity)
                .onChange(of: size) { newValue in
                    productSizeChart = ProductSizeChart(sizeName: sizes.firstIndex(of: size) ?? 0,
                                                        sizeDimension:
                                                            ["chest": Int(chest) ?? 0,
                                                             "height": Int(height) ?? 0,
                                                             "waist": Int(waist) ?? 0])
                }
                
                HStack(spacing: 40){
                    TextField("", text: $chest)
                        .placeholder(when: chest.isEmpty, text: "0"){}
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .onChange(of: chest) { newValue in
                            productSizeChart = ProductSizeChart(sizeName: sizes.firstIndex(of: size) ?? 0, sizeDimension: ["chest": Int(chest) ?? 0, "height": Int(height) ?? 0, "waist": Int(waist) ?? 0])
                                                                    
                        }
                        
                    TextField("", text: $waist)
                        .placeholder(when: waist.isEmpty, text: "0"){}
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .onChange(of: waist) { newValue in
                            productSizeChart = ProductSizeChart(sizeName: sizes.firstIndex(of: size) ?? 0, sizeDimension: ["chest": Int(chest) ?? 0, "height": Int(height) ?? 0, "waist": Int(waist) ?? 0])
                        }
                    
                    TextField("", text: $height)
                        .placeholder(when: height.isEmpty, text: "0"){}
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .onChange(of: height) { newValue in
                            productSizeChart = ProductSizeChart(sizeName: sizes.firstIndex(of: size) ?? 0, sizeDimension: ["chest": Int(chest) ?? 0, "height": Int(height) ?? 0, "waist": Int(waist) ?? 0])
                        }
                    
                    Button(action: removeAction) {
                        Image(systemName: "trash")
                            .font(.system(size: 24))
                            .foregroundColor(.red)
                            .padding(.horizontal)
                    }.buttonStyle(.plain)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .textFieldStyle(RoundedTextFieldStyle())
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(.clear)
        }
    }
}

struct SizeChartHeading: View {
    
    var addAction: () -> Void
    
    var body: some View {
        HStack{
            Text("Product Size Chart")
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
