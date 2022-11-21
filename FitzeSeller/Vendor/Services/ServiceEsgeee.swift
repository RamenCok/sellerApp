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
}
