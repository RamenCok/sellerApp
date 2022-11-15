//
//  ClickToAddVariantButtonView.swift
//  FitzeSeller
//
//  Created by Stephen Giovanni Saputra on 15/11/22.
//

import SwiftUI

struct ClickToAddVariantButtonView: View {
    
    var body: some View {
        
        Button {
            print("Hello, world!")
        } label: {
            HStack(alignment: .center, spacing: 20) {
                Image(systemName: "plus")
                    .font(.system(size: 24, weight: .bold))
                Text("Click here to add a variant (color)")
                    .font(.custom("Sora-Bold", size: 24))
                Spacer()
            }
            .foregroundColor(.primaryColorOnly)
            .padding(.vertical, 30)
            .padding(.horizontal)
            .background(Color(red: 249/255, green: 249/255, blue: 249/255))
            .cornerRadius(22)
        }
        .buttonStyle(.plain)
    }
}

struct ClickToAddVariantButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ClickToAddVariantButtonView()
    }
}
