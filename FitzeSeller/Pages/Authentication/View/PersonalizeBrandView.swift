//
//  PersonalizeBrandView.swift
//  FitzeSeller
//
//  Created by Kevin Harijanto on 09/11/22.
//

import SwiftUI
import FirebaseAuth

struct PersonalizeBrandView: View {
    @EnvironmentObject var appState: AppState
    @EnvironmentObject var viewModel: AuthViewModel
    
    @State var brandName = ""
    
    @State var uploadBrand = false
    @State var imageData = NSData(data: Data())
    
    var body: some View {
        VStack(spacing: 55) {
            VStack(alignment: .leading, spacing: 16) {
                Capsule()
                    .foregroundColor(.tertiaryColor)
                    .frame(width: 97, height: 30)
                
                Text("What is your brand \nidentity?")
                    .font(.custom("Sora-Bold", size: 48))
            }
            
            VStack(spacing: 37) {
                Button {
                    NSOpenPanel.openImage { result in
                        result.map { sucess in
                            imageData = sucess
                        }
                    }
//                    viewModel.login()
                } label: {
                    ZStack {
                        Circle()
                            .frame(width: 216, height: 216)
                        .foregroundColor(.gray.opacity(0.5))
                        
                        Text("+")
                            .font(.system(size: 60))
                            .foregroundColor(.backgroundColor)
                    }
                }.buttonStyle(.plain)
                
                VStack(spacing: 81) {
                    TextField("",text: self.$viewModel.brand.brandName)
                        .textFieldStyle(RoundedTextFieldStyle())
                        .frame(width: 446)
                        .placeholder(when: viewModel.brand.brandName.isEmpty, text: "Brand Name") {}
                    
                    Button {
                        let newBrand: [String: Any] = [
                            "brandName" : viewModel.brand.brandName
                        ]
                        viewModel.saveBrandData(documents: newBrand, uids: Auth.auth().currentUser!.uid) { error in
                            if let error = error{
                                print(error.localizedDescription)
                            } else {
                                appState.switchScene = .main
                            }
                        }

                    } label: {
                        Text("Upload brand")
                    }
                    .buttonStyle(PrimaryButton())
                    .disabled(viewModel.brand.brandName.isEmpty)
                    .opacity(viewModel.brand.brandName.isEmpty ? 0.6 : 1)
                    .scaleEffect(!viewModel.brand.brandName.isEmpty && uploadBrand ? 1.05 : 1)
                    .animation(.spring(), value: uploadBrand)
                    .onHover { hover in
                        uploadBrand = hover
                    }
                    .frame(maxWidth: 462, maxHeight: .infinity)
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct PersonalizeBrandView_Previews: PreviewProvider {
    static var previews: some View {
        PersonalizeBrandView()
            .background(Background())
            .frame(minWidth: 1728 / 1.5, minHeight: 1117 / 1.5)
    }
}
