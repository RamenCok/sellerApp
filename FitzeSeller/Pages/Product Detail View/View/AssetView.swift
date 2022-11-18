//
//  AssetView.swift
//  FitzeSeller
//
//  Created by Stephen Giovanni Saputra on 15/11/22.
//

import SwiftUI
import SceneKit

struct AssetView: View {
    
    let url = Bundle.main.url(forResource: "AirForce", withExtension: "usdz")!
    
    var body: some View {
        
        SceneView(
            scene: try! SCNScene(url: url, options: [.checkConsistency: true]),
            options: [.allowsCameraControl, .autoenablesDefaultLighting])
        .scaledToFit()
        .frame(maxWidth: 476, maxHeight: 680, alignment: .center)
        .background(Color.white)
        .cornerRadius(32)
        .overlay {
            RoundedRectangle(cornerRadius: 32)
                .stroke(lineWidth: 1)
                .foregroundColor(.gray.opacity(0.15))
        }
        .shadow(color: .gray.opacity(0.1), radius: 46, x: 0, y: 4)
    }
}
