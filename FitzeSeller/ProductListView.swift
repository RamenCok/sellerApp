//
//  ProductListView.swift
//  FitzeSeller
//
//  Created by Kevin Harijanto on 09/11/22.
//

import SwiftUI

struct ProductListView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    private var data: [Int] = Array(1...20)
    private var names = ["Zip Through Borg Jacket"]
    
    private let adaptiveColumns = [
        GridItem(.adaptive(minimum: 253), spacing: 20)
    ]
    
    @State var findProducts = ""
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(spacing: 36) {
                ZStack(alignment: .trailing) {
                    TextField("", text: $findProducts)
                        .textFieldStyle(RoundedTextFieldStyle())
                        .placeholder(when: findProducts.isEmpty, text: "Find Products"){}
                    
                    Image(systemName: "magnifyingglass")
                        .frame(width: 60, height: 60)
                        .font(.system(size: 16))
                        .foregroundColor(.textFieldColor)
                }
                .frame(width: 630)
                
                Button {
                    viewModel.login()
                } label: {
                    Image(systemName: "bell.badge")
                        .font(.system(size: 24, weight: .medium))
                        .foregroundColor(.primaryColor)
                }.buttonStyle(.plain)
            }
            
            Text("Live Products")
                .font(.custom("Sora-Bold", size: 40))
            
            Text("48 Products")
                .font(.custom("Sora-Regular", size: 24))
                .foregroundColor(.textColor.opacity(0.4))
            
            ScrollView {
                LazyVGrid(columns: adaptiveColumns, spacing: 62) {
                    ForEach(data, id: \.self) { number in
                        CardView(productName: names[number%1])
                    }
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding(.horizontal, 40)
        .padding(.top, 54)
    }
}

struct ProductListView_Previews: PreviewProvider {
    static var previews: some View {
        ProductListView()
            .background(Background())
            .frame(minWidth: 1728 / 1.5, minHeight: 1117 / 1.5)
    }
}
