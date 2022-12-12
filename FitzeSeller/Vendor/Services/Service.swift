//
//  Service.swift
//  FitzeSeller
//
//  Created by Kevin Harijanto on 12/12/22.
//

import Foundation
import Firebase
import FirebaseFirestore
import FirebaseStorage
import FirebaseFirestoreSwift
import SwiftUI

protocol FirebaseService {
    func fetchProduct(ref: String, completion: @escaping (Product)-> Void)
    func downloadAsset(relativePath: String,
                       completion: @escaping(_ fileUrl: URL) -> Void,
                       completion2: @escaping(_ percentage: Float,_ isDownloading: Bool) -> Void)
    func uploadImage(image: Data, completion: @escaping (String) -> Void)
    func uploadProduct(product: Product , completion: @escaping (String) -> Void)
}

class Service: FirebaseService {
    
    // MARK: - Fetching
    func fetchProduct(ref: String, completion: @escaping (Product)-> Void) {
        let db = Firestore.firestore()
        let data = db.collection("brand").document(ref)
        data.addSnapshotListener { snapshot, error in
            let productsRef = snapshot?.get("productRefSeller") as! [String]
            
            for i in productsRef {
                db.collection("productSeller").document(i).getDocument { snapshot, error in
                    completion(try! snapshot!.data(as: Product.self))
                }
            }
        }
    }
    
    func downloadAsset(relativePath: String,
                       completion: @escaping(_ fileUrl: URL) -> Void,
                       completion2: @escaping(_ percentage: Float,_ isDownloading: Bool) -> Void) {
        
        // 1. Create local directory
        let docsUrl = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first!
        let fileUrl = docsUrl.appendingPathComponent("FitzeCache/\(relativePath).usdz")
        
        // 2. Check if asset is already in the local filesystem, if it is, load that asset and return
        if FileManager.default.fileExists(atPath: fileUrl.path) {
            completion(fileUrl)
            return
        }
        
        // 3. Create a reference to the asset
        let storageRef = Storage.storage().reference(withPath: "Product3DAsset/\(relativePath).usdz")
        let downloadTask = storageRef.write(toFile: fileUrl)
        
        print("DEBUG: \(fileUrl)")

        // 4. Check download progress
        downloadTask.observe(.progress) { snapshot in
            
            let percentComplete = Float(snapshot.progress!.completedUnitCount) / Float(snapshot.progress!.totalUnitCount)
            // Update progress indicator
            if percentComplete == 1 {
                completion2(percentComplete, false)
            } else {
                completion2(percentComplete, true)
            }
        }

        downloadTask.observe(.success) { snapshot in
            // Download completed successfully
            // Stop progress indicator
            completion(fileUrl)
        }

        downloadTask.observe(.failure) { snapshot in
            // An error occurred!
            // Stop progress indicator
            downloadTask.resume()
        }
    }
    
    // MARK: - Uploading
    
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
        var documentID = ""
        
        do {
            let ref = try Firestore.firestore().collection("productSeller").addDocument(from: product)
            documentID = ref.documentID
            print("Document added with ID: \(ref.documentID)")
        }
        catch {
            print("Error adding document: \(error)")
        }
        
        // add document to brand
//        guard let uid = Auth.auth().currentUser?.uid else { return }
        let uid = "2BJGJBd3lkpQMucG9jnH"
        let brandID = Firestore.firestore().collection("brand").document(uid)

        brandID.updateData([
            "productRefSeller": FieldValue.arrayUnion([documentID])
        ])
    }
}
