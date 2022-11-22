//
//  AssetView.swift
//  FitzeSeller
//
//  Created by Stephen Giovanni Saputra on 15/11/22.
//

import SwiftUI
import SceneKit

struct AssetView: View {
    
    @EnvironmentObject var vm: AssetVM
    
    var body: some View {
        
        if vm.url == nil {
            
            RoundedRectangle(cornerRadius: 32)
                .stroke(lineWidth: 1)
                .foregroundColor(.gray.opacity(0.15))
                .shadow(color: .gray.opacity(0.1), radius: 46, x: 0, y: 4)
                .frame(maxWidth: 476, maxHeight: 680, alignment: .center)
                .background(Color.white)
                .cornerRadius(32)
            
        } else {
            SceneView(
                scene: try! SCNScene(url: vm.url!, options: [.checkConsistency: true]),
                options: [.allowsCameraControl, .autoenablesDefaultLighting]
            )
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
}
