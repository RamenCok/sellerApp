//
//  ProductAlertView.swift
//  FitzeSeller
//
//  Created by Stephen Giovanni Saputra on 10/11/22.
//

import SwiftUI

struct ProductAlertView: View {
    
    let tag: String
    var alertImageName: String {
        if tag == "Need Action" {
            return "exclamationmark.circle"
        }
        else {
            return "rectangle.and.text.magnifyingglass"
        }
    }
    var alertMessage: String {
        if tag == "Need Action" {
            return "This product needs some revision"
        }
        else {
            return "This product is on review"
        }
    }
    var alertColor: Color {
        if tag == "Need Action" {
            return .red
        }
        else {
            return .orange
        }
    }
    
    var body: some View {
        
        HStack {
            Image(systemName: alertImageName)
                .font(.system(size: 16, weight: .semibold))
            
            Text("\(alertMessage)")
                .font(.custom("Sora-Semibold", size: 16))
        }
        .foregroundColor(.white)
        .padding(16)
        .background(alertColor)
        .cornerRadius(11)
        .shadow(color: .gray.opacity(0.1), radius: 46, x: 0, y: 4)
    }
}

struct ProductAlertView_Previews: PreviewProvider {
    static var previews: some View {
        ProductAlertView(tag: Product.data[0].tag)
    }
}
