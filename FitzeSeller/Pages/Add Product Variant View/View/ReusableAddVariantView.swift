//
//  ReusableAddVariantView.swift
//  FitzeSeller
//
//  Created by Stephen Giovanni Saputra on 15/11/22.
//

import SwiftUI

struct ReusableAddVariantView: View {
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 0) {
            
            Text("Product Color")
                .font(.custom("Sora-Bold", size: 24))
                .padding(.bottom, 10)
                .foregroundColor(.black)
            
            Button {
                print("OPEN COLOR PICKER")
            } label: {
                Circle()
                    .frame(width: 40, height: 40)
                    .foregroundColor(.redColor)
            }
            .buttonStyle(.plain)
            .padding(.bottom, 34)
            
            HStack(alignment: .center, spacing: 13) {
                Text("Product Images")
                    .font(.custom("Sora-Bold", size: 24))
                    .foregroundColor(.black)
                
                Text("*Files of type ‘zip’ are only allowed and the maximum size limit is 100 MB")
                    .font(.custom("Sora-Regular", size: 12))
                    .foregroundColor(.redColor)
            }
            .padding(.bottom, 20)
            
            VStack(alignment: .center, spacing: 4) {
                
                Text("Drag your .zip file here")
                    .font(.custom("Sora-SemiBold", size: 16))
                    .foregroundColor(Color(red: 204/255, green: 204/255, blue: 204/255))
                
                Text("or")
                    .font(.custom("Sora-Regular", size: 14))
                    .padding(.bottom, 4)
                    .foregroundColor(Color(red: 204/255, green: 204/255, blue: 204/255))
                
                Button {
                    NSOpenPanel.openImage { data in
                        print("DEBUG: \(data)")
                        let saveURL = NSOpenPanel.showSavePanel{ result1 in
                            try? data.map({ nsdata in
                                nsdata.write(to: result1, atomically: true)
                            })
                        }
                    }
                } label: {
                    Text("Select file from your computer")
                        .font(.custom("Sora-Medium", size: 12))
                        .foregroundColor(Color(red: 204/255, green: 204/255, blue: 204/255))
                        .padding(.vertical, 6)
                        .padding(.horizontal, 45)
                        .background(Color.white.opacity(0.0000001))
                        .overlay {
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(lineWidth: 1)
                                .foregroundColor(Color(red: 204/255, green: 204/255, blue: 204/255))
                        }
                }
                .buttonStyle(.plain)
            }
            .padding(.vertical, 50)
            .frame(maxWidth: .infinity)
            .overlay {
                RoundedRectangle(cornerRadius: 20)
                    .stroke(style: StrokeStyle(lineWidth: 3, dash: [15]))
                    .foregroundColor(Color(red: 231/255, green: 231/255, blue: 231/255))
            }
        }
        .padding(40)
        .background(Color(red: 249/255, green: 249/255, blue: 249/255))
        .cornerRadius(22)
    }
}

struct ReusableAddVariantView_Previews: PreviewProvider {
    static var previews: some View {
        ReusableAddVariantView()
    }
}
