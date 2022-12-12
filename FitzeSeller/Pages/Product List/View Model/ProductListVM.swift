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
    
    let service: FirebaseService
    
    init(service: FirebaseService) {
        self.service = service
        getProducts()
    }
    
    func getProducts() {
        
//        guard let uid = Auth.auth().currentUser?.uid else {
//            print("No UID")
//            return
//        }
        
        let uid = "2BJGJBd3lkpQMucG9jnH"
        service.fetchProduct(ref: uid) { product in
            self.products.append(product)
        }
    }
}
