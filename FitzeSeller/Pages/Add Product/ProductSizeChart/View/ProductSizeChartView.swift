//
//  ProductSizeChartView.swift
//  FitzeSeller
//
//  Created by Kevin Harijanto on 15/11/22.
//

import SwiftUI

struct ProductSizeChartView: View {
    let screen = NSScreen.main?.visibleFrame
    
    @State var sizes = ["XS"]
    @State var bust = [""]
    @State var waist = [""]
    @State var height = [""]
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .center){
                SkillListEditor(sizes: $sizes, bust: $bust,waist: $waist, height: $height)
                
                Button {
                    var dimension = [[String: Any]]()
                    var final = [[String: Any]]()
                    
                    for i in 0..<bust.count {
                        let zipDimension = ["Bust": bust[i], "Waist": waist[i], "Height": height[i]]
                        dimension.append(zipDimension)
                    }
                    
                    for i in 0..<sizes.count {
                        let zipFinal = ["SizeName": sizes[i], "SizeDimension": dimension[i]] as [String : Any]
                        final.append(zipFinal)
                    }
                    
                    print(final)
                    
                } label: {
                    Text("Zipped")
                }

            }
            .frame(width: screen!.width * 0.5)
        }
        .padding()
    }
}

struct ProductSizeChartView_Previews: PreviewProvider {
    static var previews: some View {
        ProductSizeChartView()
            .background(Background())
            .frame(minWidth: 1600 / 1.2, minHeight: 1000 / 1.2)
    }
}

