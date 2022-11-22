//
//  AddProductViewModel.swift
//  FitzeSeller
//
//  Created by Kevin Harijanto on 22/11/22.
//

import SwiftUI

class AddProductViewModel: ObservableObject {
    
    let service = ServiceKevin()
    
    func uploadImage(image: NSImage, completion: @escaping (String) -> Void) {
        service.uploadImage(image: jpegDataFrom(image:image)) { callback in
            completion(callback)
        }
    }
    
    func jpegDataFrom(image:NSImage) -> Data {
        let cgImage = image.cgImage(forProposedRect: nil, context: nil, hints: nil)!
        let bitmapRep = NSBitmapImageRep(cgImage: cgImage)
        let jpegData = bitmapRep.representation(using: NSBitmapImageRep.FileType.jpeg, properties: [:])!
        return jpegData
    }
    
    func uploadProduct(product: Product, completion: @escaping (String) -> Void) {
        service.uploadProduct(product: product) { callback in
            completion(callback)
        }
    }
}


