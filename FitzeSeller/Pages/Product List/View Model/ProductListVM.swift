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
    
    @Published var products = [Product]()
    
    init() {
        getProducts()
    }
    
    func getProducts() {
        
//        guard let uid = Auth.auth().currentUser?.uid else {
//            print("No UID")
//            return
//        }
        
        let uid = "2BJGJBd3lkpQMucG9jnH"
        ServiceEsgeee().fetchProduct(ref: uid) { product in
            self.products.append(product)
        }
    }
}
