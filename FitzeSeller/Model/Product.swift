//
//  Card.swift
//  FitzeSeller
//
//  Created by Kevin Harijanto on 10/11/22.
//

import SwiftUI

struct ProductFetch: Identifiable, Equatable {
    
    static func == (lhs: ProductFetch, rhs: ProductFetch) -> Bool {
        return lhs.productName == rhs.productName && lhs.productDesc == rhs.productDesc && lhs.productImage == rhs.productImage
    }
    
    var id = UUID()
    var productName: String
    var productDesc: String
    var productImage: String
    var productGender: String
    var colorsAsset: [[String: Any]]
    var productSizeChart: [ProductSizeChart]
    var productLinks: [ProductLink]
    var tag: String
    
    init(dictionary: [String: Any]) {
        self.productName = dictionary["productName"] as? String ?? ""
        self.productDesc = dictionary["productDesc"] as? String ?? ""
        self.productImage = dictionary["productImage"] as? String ?? ""
        self.productGender = dictionary["productGender"] as? String ?? ""
        self.colorsAsset = dictionary["colorsAsset"] as? [[String: Any]] ?? [[:]]
        self.productSizeChart = dictionary["productSizeChart"] as? [ProductSizeChart] ?? [ProductSizeChart(sizeName: 10, sizeDimension: [:])]
        self.productLinks = dictionary["buyLink"] as? [ProductLink] ?? [ProductLink(siteName: "", link: "")]
        self.tag = dictionary["tag"] as? String ?? ""
    }
}


struct Product: Identifiable, Equatable {
    static func == (lhs: Product, rhs: Product) -> Bool {
        return lhs.productName == rhs.productName && lhs.productDesc == rhs.productDesc && lhs.productImage == rhs.productImage
    }
    
    var id = UUID()
    var productName: String
    var productDesc: String
    var productImage: String
    var productGender: String
    var colorsAsset: [[String: String]] // color+zip link di storage, kl acc ganti jd name
    var productSizeChart: [[String: Any]]
    var buyLink: [[String: Any]]
    let tag: String
}

struct ProductSizeChart {
    var sizeName: Int
    var sizeDimension: [String: Int]
}

struct ProductLink {
    var siteName: String
    var link: String
}


extension Product {
    static var data: [Product] =  {
        [
            Product(productName: "Air Pack French Terry Hoodie",
                    productDesc: "Deskripsi",
                    productImage: "https://firebasestorage.googleapis.com/v0/b/fitze-main.appspot.com/o/ProductImages%2Fforest-soldier.jpg?alt=media&token=d1f6e06c-a178-493d-8a37-91053f0f2725",
                    productGender: "Male",
                    colorsAsset: colorAsset,
                    productSizeChart: sizeChart,
                    buyLink: link,
                    tag: "Live"),
            Product(productName: "Zip Through Borg",
                    productDesc: "Deskripsi 2",
                    productImage: "https://firebasestorage.googleapis.com/v0/b/fitze-main.appspot.com/o/ProductImages%2Fforest-soldier.jpg?alt=media&token=d1f6e06c-a178-493d-8a37-91053f0f2725",
                    productGender: "Female",
                    colorsAsset: colorAsset,
                    productSizeChart: sizeChart,
                    buyLink: link,
                    tag: "On Review")
        ]
    }()
    
    static var colorAsset: [[String: String]] = {
       [
        ["assetLink": "Suit_Black", "colors": "4B5320"],
        ["assetLink": "Denim_shirt", "colors": "000000"]
       ]
    }()
    
    static var sizeChart: [[String: Any]] = {
        [
            ["sizeName": 0,
             "sizeDimension": ["chest": 112, "height": 185, "waist": 92]],
             ["sizeName": 1,
              "sizeDimension": ["chest": 120, "height": 185, "waist": 100]]
        ]
    }()
             
    static var link: [[String: Any]] = {
       [
        ["siteName": "Tokopedia",
        "link": "https://www.tokopedia.com/oriama/set-seragam-pria-rusia-gorka-3-pakaian-tempur-militer-taktis-pakaian-k?extParam=ivf%3Dfalse%26src%3Dsearch"],
       ]
    }()
}
