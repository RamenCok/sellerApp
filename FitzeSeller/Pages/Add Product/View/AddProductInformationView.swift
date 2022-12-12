//
//  AddProductInformationView.swift
//  FitzeSeller
//
//  Created by Kevin Harijanto on 21/11/22.
//

import SwiftUI

struct AddProductInformationView: View {
    @EnvironmentObject var vm: AddProductViewModel
    @Binding var chosenPhase: Int
    @Binding var productName: String
    @Binding var productDesc: String
    @Binding var productImage: String
    @Binding var productGender: String
    
    @Binding var colorsAsset: [ColorsAsset]
    @Binding var productSizeChart: [ProductSizeChart]
    @Binding var productLinks: [ProductLink]
    @Binding var tag: String
    
    let screen = NSScreen.main?.visibleFrame
    
    var body: some View {
        
        switch chosenPhase {
        case 1:
            ScrollView {
                VStack(alignment: .leading, spacing: 40) {
                    VStack(alignment: .leading) {
                        FormHeading(text: "Gender")
                        HStack(spacing: 12) {
                            ReusableGenderButton(text: "Female", chosenGender: $productGender)
                            ReusableGenderButton(text: "Male", chosenGender: $productGender)
                            ReusableGenderButton(text: "Unisex", chosenGender: $productGender)
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
                                // Freeze UI
                                print("FREEZE")
                                result.map { image in
                                    vm.uploadImage(image: image) { url in
                                        self.productImage = url
                                        // Unfreeze UI
                                        print("DONE!!")
                                    }
                                }
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
            }
            .frame(width: screen!.width * 0.4675925926, height: screen!.height * 0.5389435989, alignment: .leading)
        case 2:
            ProductSizeChartView(productSizeChart: $productSizeChart)
                .frame(width: screen!.width * 0.4675925926, height: screen!.height * 0.5389435989, alignment: .leading)
        case 3:
            AddProductVariantView(colorsAsset: $colorsAsset)
                .frame(width: screen!.width * 0.4675925926, height: screen!.height * 0.5389435989, alignment: .leading)
        case 4:
            ProductCommerceView(productLinks: $productLinks)
                .frame(width: screen!.width * 0.4675925926, height: screen!.height * 0.5389435989, alignment: .leading)
        default:
            ProductCommerceView(productLinks: $productLinks)
                .frame(width: screen!.width * 0.4675925926, height: screen!.height * 0.5389435989, alignment: .leading)
        }
        
    }
}

//struct AddProductInformationView_Previews: PreviewProvider {
//    static var previews: some View {
//        AddProductInformationView()
//    }
//}
