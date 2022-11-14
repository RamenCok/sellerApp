//
//  Background.swift
//  FitzeSeller
//
//  Created by Kevin Harijanto on 09/11/22.
//

import SwiftUI

struct Background: View {
    var body: some View {
        ZStack {
            Color.backgroundColor
            
            Image("background")
                .resizable()
                .aspectRatio(contentMode: .fill)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}
