//
//  ProductSizeChartView.swift
//  FitzeSeller
//
//  Created by Kevin Harijanto on 15/11/22.
//

import SwiftUI

struct ProductSizeChartView: View {
    let screen = NSScreen.main?.visibleFrame
    @Binding var productSizeChart: [ProductSizeChart]
    @State var sizes = [String]()
    @State var chest = [String]()
    @State var waist = [String]()
    @State var height = [String]()
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .center){
                SkillListEditor(productSizeChart: $productSizeChart,
                                sizes: $sizes,
                                chest: $chest,
                                waist: $waist,
                                height: $height)
            }
            .frame(width: screen!.width * 0.5)
        }
        .padding()
    }
}
