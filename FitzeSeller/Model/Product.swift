//
//  Card.swift
//  FitzeSeller
//
//  Created by Kevin Harijanto on 10/11/22.
//

import SwiftUI

struct Product: Identifiable, Equatable {
    let id = UUID()
    let productName: String
    let productColors: [Color]
//    let productImage: String
    let tag: String
}

extension Product {
    static var data: [Product] =  {
        [
            Product(productName: "Air Pack French Terry Hoodie", productColors: [.red, .blue, .green, .red, .blue, .green, .red, .blue, .green], tag: "Live"),
            Product(productName: "[OR] Zip Through Borg 2", productColors: [.green, .yellow, .red, .blue], tag: "On Review"),
            Product(productName: "[Live] Borg 3", productColors: [.red, .blue, .black], tag: "Need Action"),
            Product(productName: "[OR] Zip Through Borg 4", productColors: [.red, .blue, .teal], tag: "On Review"),
            Product(productName: "[Live] Borg 5", productColors: [.red, .yellow, .green], tag: "Live"),
            Product(productName: "[Live] Borg 6", productColors: [.red, .blue, .green, .red, .blue, .green, .red, .blue, .green], tag: "Live"),
            Product(productName: "[OR] Zip Through Borg 7", productColors: [.green, .yellow, .red, .blue], tag: "On Review"),
            Product(productName: "[OR] Zip Through Borg 8", productColors: [.red, .blue, .black], tag: "On Review"),
            Product(productName: "[Live] Borg 9", productColors: [.red, .blue, .teal], tag: "Archived"),
            Product(productName: "[Live] Borg 10", productColors: [.red, .yellow, .green], tag: "Draft"),
        ]
    }()
}
