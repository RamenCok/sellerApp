//
//  ServiceEsgeee.swift
//  FitzeSeller
//
//  Created by Stephen Giovanni Saputra on 21/11/22.
//

import Foundation
import Firebase
import FirebaseFirestore
import FirebaseStorage

class ServiceEsgeee {
    
    func fetchProduct(ref: String, completion: @escaping (Product)-> Void) {
        
        let data = Firestore.firestore().collection("brand").document(ref)
        data.addSnapshotListener { snapshot, error in
            
            let productsDictionary = snapshot?.get("productRef") as! [String]
            
            var products: [Product] = []
            
            for i in productsDictionary {
                
                Firestore.firestore().collection("product").document(i).getDocument { snapshot, error in
                    
                    let dictionary = snapshot?.data()
                    var data = Product(dictionary: dictionary ?? ["" : ""])
                    
                    let productSizeChartDict = snapshot?.get("productSizeChart") as! [[String: Any]]
                    
                    var productSizeChart: [ProductSizeChart] = []
                    
                    for product in productSizeChartDict {
                        let productSize = ProductSizeChart(sizeName: product["sizeName"] as! Int, sizeDimension: product["sizeDimension"] as! [String : Int])
                        productSizeChart.append(productSize)
                    }
                    
                    data.productSizeChart = productSizeChart
                    
                    if let productLinksDict = snapshot?.get("buyLink") {
                        
                        var productLinks: [ProductLink] = []
                        
                        for productLink in productLinksDict as! [[String: Any]] {
                            let productLink = ProductLink(siteName: productLink["siteName"] as! String, link: productLink["link"] as! String)
                            productLinks.append(productLink)
                        }
                        
                        data.productLinks = productLinks
                    }
                    completion(data)
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
}
