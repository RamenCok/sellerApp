//
//  EmptyState.swift
//  FitzeSeller
//
//  Created by Kevin Harijanto on 11/11/22.
//

import SwiftUI

struct EmptyState: View {
    var body: some View {
        VStack {
            Image("emptystate")
            
            Text("Oops! Nothing to see here..")
                .font(.custom("Sora-Bold", size: 18))
                .foregroundColor(.lightGrey2)
            
            Text("Start adding new products")
                .font(.custom("Sora-Regular", size: 16))
                .foregroundColor(.lightGrey2)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct EmptyState_Previews: PreviewProvider {
    static var previews: some View {
        EmptyState()
            .background(Background())
            .frame(minWidth: 1728 / 1.5, minHeight: 1117 / 1.5)
    }
}
