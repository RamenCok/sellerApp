//
//  TestGridPicker.swift
//  FitzeSeller
//
//  Created by Kevin Harijanto on 09/11/22.
//

import SwiftUI

enum Items: String, CaseIterable, Equatable {
    case item1
    case item2
    case item3
    case item4
    case item5
    case item6
}

struct GridRows:View {
    let item: Items
    
    @Binding var items: [Items]
    
    var body: some View {
        Button {
            if items.contains(item) {
                items.removeAll { $0 == item}
            } else {
                items.append(item)
            }
        } label: {
            Text(item.rawValue)
                .tag(item)
                .foregroundColor(items.contains(item) ? .purple : .white)
        }
        .buttonStyle(.plain)
        .frame(width: 253, height: 253)
        .background(items.contains(item) ? Color.white : Color.purple)
        .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
    }
}

struct GridPicker: View {
    var columns: [GridItem] = Array(repeating: .init(.adaptive(minimum: 253)), count: 2)
    private let adaptiveColumns = [
        GridItem(.adaptive(minimum: 253), spacing: 20)
    ]
    
    @State  var selectedItems: [Items] = []
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach(Items.allCases, id: \.self) { item in
                    GridRows(item: item, items: $selectedItems)
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct GridPicker_Previews: PreviewProvider {
    static var previews: some View {
        GridPicker()
            .background(Background())
            .frame(minWidth: 1728 / 1.5, minHeight: 1117 / 1.5)
    }
}
