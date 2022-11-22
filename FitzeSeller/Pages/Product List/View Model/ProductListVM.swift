//
//  ProductListVM.swift
//  FitzeSeller
//
//  Created by Stephen Giovanni Saputra on 21/11/22.
//

import Foundation
import SwiftUI
import Firebase
import FirebaseAuth

class ProductListVM: ObservableObject {
    
    @Published var products = [ProductFetch]()
    
    init() {
        getProducts()
    }
    
    func getProducts() {
        
        guard let uid = Auth.auth().currentUser?.uid else { return }
        ServiceEsgeee().fetchProduct(ref: uid) { product in
            self.products.append(product)
        }
    }
}
