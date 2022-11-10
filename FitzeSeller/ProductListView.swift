//
//  ProductListView.swift
//  FitzeSeller
//
//  Created by Kevin Harijanto on 09/11/22.
//

import SwiftUI

struct ProductListView: View {
    let ListName: String
    let cards: [Card]
    
    var searchResults: [Card] {
        if searchText.isEmpty {
            return cards
        }
        else {
            return cards.filter { $0.productName.lowercased().contains(searchText.lowercased())
                
            }
        }
    }
    
    private let adaptiveColumns = [GridItem(.adaptive(minimum: 253), spacing: 20, alignment: .leading)]
    
    @State var searchText = ""
    @State var isSelected = false
    @State  var selectedItems: [Card] = []
    
    @State private var currentSubview = AnyView(LoginView())
    @State private var showingSubview = false
    
    var body: some View {
        StackNavigationView(currentSubview: $currentSubview, showingSubview: $showingSubview) {
            VStack(alignment: .leading) {
                HStack(spacing: 36) {
                    ZStack(alignment: .trailing) {
                        TextField("", text: $searchText)
                            .textFieldStyle(RoundedTextFieldStyle())
                            .placeholder(when: searchText.isEmpty, text: "Find Products"){}
                        
                        Image(systemName: "magnifyingglass")
                            .frame(width: 60, height: 60)
                            .font(.system(size: 16))
                            .foregroundColor(.textFieldColor)
                    }
                    .frame(width: 630)
                    
                    Button {
                        
                    } label: {
                        Image(systemName: "bell.badge")
                            .font(.system(size: 24, weight: .medium))
                            .foregroundColor(.primaryColor)
                    }.buttonStyle(.plain)
                }
                
                HStack {
                    VStack(alignment: .leading) {
                        Text("\(ListName) Products")
                            .font(.custom("Sora-Bold", size: 40))
                        
                        Text("\(cards.count) Products")
                            .font(.custom("Sora-Regular", size: 24))
                            .foregroundColor(.textColor.opacity(0.4))
                    }
                    
                    Spacer()
                    
                    if isSelected {
                        HStack(spacing: 27) {
                            Button {
                                
                            } label: {
                                Text("Delete")
                                    .font(.custom("Sora-Semibold", size: 24))
                                    .foregroundColor(.redColor)
                                    .underline()
                            }.buttonStyle(.plain)
                            
                            Button {
                                isSelected.toggle()
                                selectedItems.removeAll()
                            } label: {
                                Text("Done")
                                    .font(.custom("Sora-Semibold", size: 24))
                                    .foregroundColor(.primaryColor)
                                    .underline()
                            }.buttonStyle(.plain)
                        }
                    }
                    else {
                        Button {
                            isSelected.toggle()
                            // action select
                        } label: {
                            
                            Text("Select")
                                .font(.custom("Sora-Semibold", size: 24))
                                .foregroundColor(.primaryColor)
                                .underline()
                                .padding(.trailing, 10)
                            
                        }
                        .buttonStyle(.plain)
                    }
                    
                }
                
                ScrollView(showsIndicators: false) {
                    LazyVGrid(columns: adaptiveColumns, spacing: 62) {
                        ForEach(searchResults, id: \.id) { card in
                            Button {
                                if isSelected {
                                    if selectedItems.contains(card) {
                                        selectedItems.removeAll { $0 == card}
                                    } else {
                                        selectedItems.append(card)
                                    }
                                }
                                else {
                                    showSubview(view: AnyView(ProductDetailsView(card: card)))
                                }
                            } label: {
                                CardView(card: card)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 16)
                                            .stroke(selectedItems.contains(card) ? Color.primaryColor : Color.gray, lineWidth: selectedItems.contains(card) ? 5 : 1)
                                    )
                            }.buttonStyle(.plain)
                        }
                    }
                    .padding(.bottom, 20)
                    .padding([.top, .leading], 5)
                    .frame(alignment: .leading)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding(.horizontal, 40)
            .padding(.top, 20)
        }
    }
    
    private func showSubview(view: AnyView) {
        withAnimation(.easeOut(duration: 0.3)) {
            currentSubview = view
            showingSubview = true
        }
    }
}

struct ProductListView_Previews: PreviewProvider {
    static var previews: some View {
        ProductListView(ListName: "Live", cards: Card.data)
            .background(Background())
            .frame(minWidth: 1728 / 1.5, minHeight: 1117 / 1.5)
    }
}
