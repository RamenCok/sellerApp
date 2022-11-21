//
//  FormHeading.swift
//  FitzeSeller
//
//  Created by Bryan Kenneth on 16/11/22.
//

import SwiftUI

struct FormHeading: View {
    let text: String
    
    var body: some View {
        Text(text)
            .font(.custom("Sora-Bold", size: 32))
    }
}

struct FormHeading_Previews: PreviewProvider {
    static var previews: some View {
        FormHeading(text: "Yow")
    }
}
