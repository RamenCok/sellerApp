//
//  RadioButton.swift
//  FitzeSeller
//
//  Created by Stephen Giovanni Saputra on 15/11/22.
//

import SwiftUI

struct RadioButton: View {
    
    @Binding var selectedColor: Color?
    var color: Color
    
    var body: some View {
        
        
        Button {
            withAnimation {
                self.selectedColor = self.color
            }
        } label: {
            
            Circle()
                .foregroundColor(self.color)
                .scaledToFit()
                .frame(maxWidth: 31, alignment: .center)
                .overlay {
                    Circle()
                        .stroke(lineWidth: 3)
                        .foregroundColor(self.selectedColor == color ? .black : .clear)
                }
        }
        .buttonStyle(.plain)
    }
}

struct RadioButtonGroup: View {

    let colors: [Color]
    @State var selectedColor: Color?

    var body: some View {
        
        HStack(spacing: 16) {
            ForEach(colors, id: \.description) { color in
                RadioButton(selectedColor: self.$selectedColor, color: color)
            }
        }
    }
}
