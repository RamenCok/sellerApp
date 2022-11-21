//
//  AddProductView.swift
//  FitzeSeller
//
//  Created by Bryan Kenneth on 16/11/22.
//

import SwiftUI

struct AddProductView: View {
    @EnvironmentObject var appState: AppState
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
        ZStack {
            Button {
                appState.switchScene = .main
            } label: {
                Image(systemName: "chevron.left")
                    .font(.system(size: 36))
                    .foregroundColor(.primaryColor)
            }
            .buttonStyle(.plain)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            .padding(40)
            
            ScrollView(showsIndicators: false) {
                VStack(alignment: .center, spacing: screen!.height * 0.04476275739) {
                    HStack {
                        TimelineTiles(number: 1, chosenPhase: $chosenPhase)
                        TimelineTiles(number: 2, chosenPhase: $chosenPhase)
                        TimelineTiles(number: 3, chosenPhase: $chosenPhase)
                        TimelineTiles(number: 4, chosenPhase: $chosenPhase)
                    }
                    
                    Divider()
                        .padding(.horizontal, screen!.width * 0.1041666667)
                    
                    AddProductInformationView(chosenPhase: $chosenPhase, gender: $gender, productName: $productName, productDesc: $productDesc)
                        
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
                        else {
                            Button {
                                // submit
                                appState.switchScene = .main
                            } label: {
                                HStack {
                                    Text("Submit")
                                }
                                
                            }.buttonStyle(PrimaryButton())
                                .frame(width: screen!.width * 0.09085648148)
                        }
                    }.frame(width: screen!.width * 0.4675925926, alignment: .trailing)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: screen?.height)
            .padding(40)
            .zIndex(-1)
        }
    }
}

//struct AddProductView_Previews: PreviewProvider {
//    static var previews: some View {
//        AddProductView()
//    }
//}
