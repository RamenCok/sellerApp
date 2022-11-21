//
//  ReusableGenderButton.swift
//  FitzeSeller
//
//  Created by Bryan Kenneth on 16/11/22.
//

import SwiftUI

struct ReusableGenderButton: View {
    let text: String
    @Binding var chosenGender: String
    var body: some View {
        Button {
            chosenGender = text
        } label: {
            Text(text)
                .font(.custom("Sora-Regular", size: 16))
               
                .frame(maxHeight: 54)
                .foregroundColor(chosenGender == text ? .white : Color.primaryButtonColor)
                .background(chosenGender == text ? Color.primaryButtonColor : Color.white)
                
        }
        .frame(width: 110, height: 44, alignment: .center)
        .background(chosenGender == text ? Color.primaryButtonColor : Color.white)
        .cornerRadius(31)
        .overlay(
            RoundedRectangle(cornerRadius: 31)
                .stroke(Color.primaryButtonColor, lineWidth: 1)
        )
        .buttonStyle(.plain)
        
//        Button("Female") {
//            print("The gender is name")
//        }
        
        

    }
}

//struct ReusableGenderButton_Previews: PreviewProvider {
//    static var previews: some View {
//        ReusableGenderButton()
//    }
//}
