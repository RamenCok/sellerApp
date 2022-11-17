//
//  SizeChart.swift
//  FitzeSeller
//
//  Created by Kevin Harijanto on 15/11/22.
//

import SwiftUI

struct SkillListEditor: View {
    
    @Binding var sizes: [String]
    @Binding var bust: [String]
    @Binding var waist: [String]
    @Binding var height: [String]
    
    func getBindingSizes(forIndex index: Int) -> Binding<String> {
        return Binding<String>(get: { sizes[index] },
                               set: { sizes[index] = $0 })
    }
    
    func getBindingBust(forIndex index: Int) -> Binding<String> {
        return Binding<String>(get: { bust[index] },
                               set: { bust[index] = $0 })
    }
    
    func getBindingWaist(forIndex index: Int) -> Binding<String> {
        return Binding<String>(get: { waist[index] },
                               set: { waist[index] = $0 })
    }
    
    func getBindingHeight(forIndex index: Int) -> Binding<String> {
        return Binding<String>(get: { height[index] },
                               set: { height[index] = $0 })
    }
    
    var body: some View {
        SizeChartHeading{
            self.sizes.append("XS")
            self.bust.append("")
            self.waist.append("")
            self.height.append("")
        }
        
        HStack {
            Text("Size")
                .font(.custom("Sora-SemiBold", size: 24))
            Spacer().frame(width: 200)
            Text("Bust")
                .font(.custom("Sora-SemiBold", size: 24))
            Text("Waist")
                .font(.custom("Sora-SemiBold", size: 24))
            Text("Height")
                .font(.custom("Sora-SemiBold", size: 24))
        }
        Divider()
        
        ForEach(0..<sizes.count, id: \.self) { index in
            ListItem(size: getBindingSizes(forIndex: index), bust: getBindingBust(forIndex: index), waist: getBindingWaist(forIndex: index), height: getBindingHeight(forIndex: index)) {
                self.sizes.remove(at: index)
                self.bust.remove(at: index)
                self.waist.remove(at: index)
                self.height.remove(at: index)
            }
        }
    }
}

struct ListItem: View {
    
    @Binding var size: String
    @Binding var bust: String
    @Binding var waist: String
    @Binding var height: String
    var removeAction: () -> Void
    
    let sizes = ["XS", "S", "M", "L", "XL"]
    
    var body: some View {
        VStack(alignment: .leading){
            Spacer().frame(height: 8)
            HStack{
                Picker("", selection: $size) {
                    ForEach(sizes, id: \.self) {
                        Text($0)
                    }
                }
                .pickerStyle(.menu)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack{
                        TextField("", text: $bust)
                            .placeholder(when: bust.isEmpty, text: "0"){}
                        TextField("", text: $waist)
                            .placeholder(when: waist.isEmpty, text: "0"){}
                        TextField("", text: $height)
                            .placeholder(when: height.isEmpty, text: "0"){}
                    }
                    .textFieldStyle(RoundedTextFieldStyle())
                }
                
                Button(action: removeAction) {
                    Image(systemName: "xmark.bin")
                        .foregroundColor(.red)
                        .padding(.horizontal)
                }.buttonStyle(.plain)
            }
            
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

struct SizeChart_Previews: PreviewProvider {
    static var previews: some View {
        ProductSizeChartView()
            .background(Background())
            .frame(minWidth: 1600 / 1.2, minHeight: 1000 / 1.2)
    }
}
