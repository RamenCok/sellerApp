//
//  Brand.swift
//  FitzeSeller
//
//  Created by Bryan Kenneth on 21/11/22.
//

import SwiftUI

struct Brand: Codable {
    var brandName: String
    var brandImage: String
    
    init(dictionary: [String: Any]) {
        self.brandName = dictionary["brandName"] as? String ?? ""
        self.brandImage = dictionary["brandImage"] as? String ?? ""
    }
}
