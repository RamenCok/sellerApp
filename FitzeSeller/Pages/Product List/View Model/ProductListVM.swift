//
//  ProductListVM.swift
//  FitzeSeller
//
//  Created by Stephen Giovanni Saputra on 21/11/22.
//

import Foundation
import SwiftUI
import Firebase

class ProductListVM: ObservableObject {
    
    @Published var products = [Product]()
    
    init() {
        getProducts()
    }
    
    func getProducts() {
        
        let uid = "NzRbv4o3bKXMZ1retvuJ"
        ServiceEsgeee().fetchProduct(ref: uid) { product in
            self.products.append(product)
            print(self.products)
        }
    }
}
