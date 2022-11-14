//
//  ProductDetailsView.swift
//  FitzeSeller
//
//  Created by Kevin Harijanto on 10/11/22.
//

import SwiftUI

struct ProductDetailsView: View {
    let card: Card
    
    var body: some View {
        Text("\(card.productName)")
    }
}

struct ProductDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailsView(card: Card.data[0])
    }
}
