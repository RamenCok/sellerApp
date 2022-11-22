//
//  AssetVM.swift
//  FitzeSeller
//
//  Created by Stephen Giovanni Saputra on 22/11/22.
//

import Foundation

class AssetVM: ObservableObject {
    
    @Published var url: URL?
    @Published var percentage: Float = 0.0
    @Published var isDownloading: Bool = true
    
    func asyncLoadModel(filename: String) {
        
        ServiceEsgeee().downloadAsset(relativePath: filename) { fileUrl in
            self.url = fileUrl
        } completion2: { percentage, isDownloading in
            self.percentage = percentage
            self.isDownloading = isDownloading
            
            print("DEBUG: \(self.percentage)")
            print("DEBUG: \(self.isDownloading)")
        }
    }
}
