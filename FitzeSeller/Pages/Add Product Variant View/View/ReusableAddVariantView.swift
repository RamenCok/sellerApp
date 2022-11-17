//
//  ReusableAddVariantView.swift
//  FitzeSeller
//
//  Created by Stephen Giovanni Saputra on 15/11/22.
//

import SwiftUI

struct ReusableAddVariantView: View {
    
    @Binding var color: Color
    @Binding var imageData: NSData
    
    var removeAction: () -> Void
    
    var body: some View {
        
        HStack(alignment: .center) {
            
            VStack(alignment: .leading, spacing: 0) {
                
                Text("Product Color")
                    .font(.custom("Sora-Bold", size: 24))
                    .padding(.bottom, 10)
                    .foregroundColor(.black)
                
                ColorPickerView(color: $color)
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
                            
                            data.map({ success in
                                imageData = success
                            })
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
            
            Button {
                self.removeAction()
            } label: {
                Image(systemName: "trash")
                    .font(.system(size: 28, weight: .bold))
                    .foregroundColor(.redColor)
            }
            .buttonStyle(.plain)
            .padding()
        }
    }
}

struct ColorPickerView: View {
    
    @Binding var color: Color
    
    var body: some View {
        
        HStack(spacing: 20) {
            Circle()
                .foregroundColor(color)
                .scaledToFit()
                .frame(width: 40, height: 40)
            
            ZStack {
                
                ColorPicker("", selection: $color)
                    .scaleEffect(CGSize(width: 2, height: 1))
                
                Text("Pick a color")
                    .font(.custom("Sora-SemiBold", size: 16))
                    .padding(.vertical, 4)
                    .padding(.horizontal)
                    .background(Color.white)
                    .overlay(content: {
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(lineWidth: 1)
                            .foregroundColor(.primaryColorOnly)
                    })
                    .allowsHitTesting(false)
            }
        }
    }
}

