//
//  ProductAlertView.swift
//  FitzeSeller
//
//  Created by Stephen Giovanni Saputra on 10/11/22.
//

import SwiftUI

struct ProductAlertView: View {
    
    var alertImageName: String = ""
    var alertMessage: String = ""
    var alertColor: Color = Color.red
    
    var body: some View {
        
        HStack {
            
            Image(systemName: "exclamationmark.circle")
                .font(.system(size: 16, weight: .semibold))
            
            Text("This product needs some revision")
                .font(.custom("Sora-Semibold", size: 16))
        }
        .foregroundColor(.white)
        .padding(16)
        .background(Color.red)
        .cornerRadius(11)
        .shadow(color: .gray.opacity(0.1), radius: 46, x: 0, y: 4)
    }
}

struct ProductAlertView_Previews: PreviewProvider {
    static var previews: some View {
        ProductAlertView()
    }
}
