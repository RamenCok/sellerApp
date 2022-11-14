//
//  Card.swift
//  FitzeSeller
//
//  Created by Kevin Harijanto on 10/11/22.
//

import SwiftUI

struct Card: Identifiable, Equatable {
    let id = UUID()
    let productName: String
    let productColors: [Color]
//    let productImage: String
    let tag: String
}

extension Card {
    static var data: [Card] =  {
        [
            Card(productName: "Air Pack French Terry Hoodie", productColors: [.red, .blue, .green, .red, .blue, .green, .red, .blue, .green], tag: "Live"),
            Card(productName: "[OR] Zip Through Borg 2", productColors: [.green, .yellow, .red, .blue], tag: "On Review"),
            Card(productName: "[Live] Borg 3", productColors: [.red, .blue, .black], tag: "Need Action"),
            Card(productName: "[OR] Zip Through Borg 4", productColors: [.red, .blue, .teal], tag: "On Review"),
            Card(productName: "[Live] Borg 5", productColors: [.red, .yellow, .green], tag: "Live"),
            Card(productName: "[Live] Borg 6", productColors: [.red, .blue, .green, .red, .blue, .green, .red, .blue, .green], tag: "Live"),
            Card(productName: "[OR] Zip Through Borg 7", productColors: [.green, .yellow, .red, .blue], tag: "On Review"),
            Card(productName: "[OR] Zip Through Borg 8", productColors: [.red, .blue, .black], tag: "On Review"),
            Card(productName: "[Live] Borg 9", productColors: [.red, .blue, .teal], tag: "Live"),
            Card(productName: "[Live] Borg 10", productColors: [.red, .yellow, .green], tag: "Live"),
        ]
    }()
}
