//
//  AddProductView.swift
//  FitzeSeller
//
//  Created by Bryan Kenneth on 16/11/22.
//

import SwiftUI

struct AddProductView: View {
    @State var chosenPhase = 1
    
    @State var isOneLocked = false
    @State var isTwoLocked = true
    @State var isThreeLocked = true
    @State var isFourLocked = true
    
    @State var gender = "Female"
    @State var productName = ""
    @State var productDesc = ""
    
    let screen = NSScreen.main?.visibleFrame
    
    var body: some View {
        VStack(alignment: .center, spacing: screen!.height * 0.04476275739) {
            HStack {
                TimelineTiles(number: 1, chosenPhase: $chosenPhase)
                TimelineTiles(number: 2, chosenPhase: $chosenPhase)
                TimelineTiles(number: 3, chosenPhase: $chosenPhase)
                TimelineTiles(number: 4, chosenPhase: $chosenPhase)
            }
            
            Divider()
                .padding(.horizontal, screen!.width * 0.1041666667)
            
            ScrollView {
                VStack(alignment: .leading, spacing: 40) {
                    VStack(alignment: .leading) {
                        FormHeading(text: "Gender")
                        HStack(spacing: 12) {
                            ReusableGenderButton(text: "Female", chosenGender: $gender)
                            ReusableGenderButton(text: "Male", chosenGender: $gender)
                            ReusableGenderButton(text: "Unisex", chosenGender: $gender)
                        }
                    }
                    
                    VStack(alignment: .leading) {
                        FormHeading(text: "Product Name")
                        TextField("Enter Product Name", text: $productName)
                    }.textFieldStyle(RoundedTextFieldStyle())
                    
                    VStack(alignment: .leading){
                        FormHeading(text: "Product Description")
                        TextEditor(text: $productDesc)
                            .frame(height: screen!.height * 0.1553480475)
                            .padding(.vertical)
                            .padding(.horizontal, 24)
                            .font(.custom("Sora-Regular", size: 16))
                            .foregroundColor(.textFieldColor)
                            .background(
                                Color.textFieldBG
                            )
                            .clipShape(RoundedRectangle(cornerRadius: 16))
                            
                    }.textFieldStyle(RoundedTextFieldStyle())
                    
                    VStack(alignment: .leading){
                        FormHeading(text: "Product Thumbnail (Real Photo)")
                        Button {
                            NSOpenPanel.openImage { result in
                                print(result)
                            }
                        } label: {
                            Image(systemName: "plus")
                                .font(.system(size: 32))
                                .frame(width: 178, height: 178)
                                .background(Color.textFieldBG)
                        }.frame(width: 178, height: 178)
                            .background(Color.textFieldBG)
                            .cornerRadius(20)
                            .buttonStyle(.plain)
                    }
                }.frame(maxWidth: .infinity, alignment: .leading)
                
                    
            }.frame(width: screen!.width * 0.4675925926, height: screen!.height * 0.5389435989, alignment: .leading)
                
            HStack{
                if chosenPhase > 1 {
                    Button {
                        if chosenPhase > 1{
                            chosenPhase -= 1
                        }
                        
                    } label: {
                        HStack {
                            Image(systemName: "chevron.left")
                            Text("Previous")
                        }
                    }.buttonStyle(SecondaryButton())
                        .frame(width: screen!.width * 0.09085648148)
                }
                
                
                if chosenPhase < 4 {
                    Button {
                        if chosenPhase < 4 {
                            chosenPhase += 1
                        }
                        
                    } label: {
                        HStack {
                            Text("Next")
                            Image(systemName: "chevron.right")
                        }
                        
                    }.buttonStyle(PrimaryButton())
                        .frame(width: screen!.width * 0.09085648148)
                }
               

            }.frame(width: screen!.width * 0.4675925926, alignment: .trailing)
        }
    }
}

//struct AddProductView_Previews: PreviewProvider {
//    static var previews: some View {
//        AddProductView()
//    }
//}
