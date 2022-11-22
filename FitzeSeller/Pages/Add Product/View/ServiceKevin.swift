//
//  ServiceKevin.swift
//  FitzeSeller
//
//  Created by Kevin Harijanto on 22/11/22.
//

import Firebase
import FirebaseFirestore
import FirebaseStorage
import SwiftUI

class ServiceKevin {
    
    func uploadImage(image: Data, completion: @escaping (String) -> Void) {
        
        let storage = Storage.storage().reference().child("ProductImages/test.jpeg")
        
        let metaData = StorageMetadata()
        metaData.contentType = "image/jpeg"
        
        storage.putData(image, metadata: metaData) { _ in
            storage.downloadURL { url, error in
                guard let productImageURL = url?.absoluteString else { return }
                
                completion(productImageURL)
            }
        }
    }
    
    func uploadProduct(product: Product , completion: @escaping (String) -> Void) {
        var ref: DocumentReference? = nil
        ref = Firestore.firestore().collection("productSeller").addDocument(data: [
            "productName": product.productName,
            "productDesc": product.productDesc,
            "productImage": product.productImage,
            "productGender": product.productGender,
            "colorsAsset": product.colorsAsset,
            "productSizeChart": product.productSizeChart,
            "buyLink": product.buyLink,
            "tag": product.tag
        ]) { err in
            if let err = err {
                print("Error adding document: \(err)")
            } else {
                print("Document added with ID: \(ref!.documentID)")
            }
        }
        
        // add document to brand
        let brandID = Firestore.firestore().collection("brand").document("2BJGJBd3lkpQMucG9jnH")

        brandID.updateData([
            "productRefSeller": FieldValue.arrayUnion([ref!.documentID])
        ])
    }
    
}
