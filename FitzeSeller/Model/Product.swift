//
//  Card.swift
//  FitzeSeller
//
//  Created by Kevin Harijanto on 10/11/22.
//

import SwiftUI
import FirebaseFirestoreSwift

struct Product: Identifiable, Equatable, Codable {
    static func == (lhs: Product, rhs: Product) -> Bool {
        return lhs.productName == rhs.productName && lhs.productDesc == rhs.productDesc && lhs.productImage == rhs.productImage
    }
    
    @DocumentID var id: String?
    var productName: String
    var productDesc: String
    var productImage: String
    var productGender: String
    var colorsAsset: [ColorsAsset]
    var productSizeChart: [ProductSizeChart]
    var buyLink: [ProductLink]
    let tag: String
}

struct ColorsAsset: Codable {
    var assetLink: String
    var colors: String
}

struct ProductSizeChart: Codable {
    var sizeName: Int
    var sizeDimension: [String: Int]
}

struct ProductLink: Codable {
    var siteName: String
    var link: String
}
