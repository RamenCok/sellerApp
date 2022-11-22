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
        switch tag {
        case "Need Action":
            return "exclamationmark.circle"
        default:
            return "rectangle.and.text.magnifyingglass"
        }
    }
    var alertMessage: String {
        switch tag {
        case "Need Action":
            return "This product needs some revision"
        default:
            return "This product is on review"
        }
    }
    var alertColor: Color {
        switch tag {
        case "Need Action":
            return .red
        default:
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
