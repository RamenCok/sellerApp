//
//  ProductListView.swift
//  FitzeSeller
//
//  Created by Kevin Harijanto on 09/11/22.
//

import SwiftUI

struct ProductListView: View {
    let ListName: String
    @Binding var products: [Product]
    
    var searchResults: [Product] {
        if searchText.isEmpty {
            return products
        }
        else {
            return products.filter { $0.productName.lowercased().contains(searchText.lowercased())
            }
        }
    }
    
    private let adaptiveColumns = [GridItem(.adaptive(minimum: 253), spacing: 20, alignment: .leading)]
    
    @State var searchText = ""
    @State var isSelected = false
    @State  var selectedItems: [Product] = []
    @State private var showAlert = false
    
    @State private var currentSubview = AnyView(LoginView())
    @State private var showingSubview = false
    @State private var showingNotification = false
    
    var body: some View {
        StackNavigationView(currentSubview: $currentSubview, showingSubview: $showingSubview) {
            ZStack(alignment: .topTrailing) {
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
                            showingNotification.toggle()
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
                            
                            Text("\(products.count) Products")
                                .font(.custom("Sora-Regular", size: 24))
                                .foregroundColor(.textColor.opacity(0.4))
                        }
                        
                        Spacer()
                        
                        if isSelected {
                            HStack(spacing: 27) {
                                Button {
                                    showAlert = true
                                } label: {
                                    Text("Delete")
                                        .font(.custom("Sora-Semibold", size: 24))
                                        .foregroundColor(.redColor)
                                        .underline()
                                }.buttonStyle(.plain)
                                    .alert("Are you sure want to delete?", isPresented: $showAlert) {
                                        Button("Sure", role: .destructive) {
                                            // delete item
                                            for card in selectedItems {
                                                products.removeAll(where: { $0 == card } )
                                            }
                                            // delete di database
                                            isSelected.toggle()
                                            selectedItems.removeAll()
                                        }
                                        Button("Cancel", role: .cancel) {
                                            isSelected.toggle()
                                            selectedItems.removeAll()
                                        }
                                    }
                                
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
                            ForEach(searchResults, id: \.id) { product in
                                Button {
                                    if isSelected {
                                        if selectedItems.contains(product) {
                                            selectedItems.removeAll { $0 == product }
                                        } else {
                                            selectedItems.append(product)
                                        }
                                    }
                                    else {
                                        showSubview(view: AnyView(ProductDetailView(product: product)))
                                    }
                                } label: {
                                    CardView(product: product)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 32)
                                                .stroke(selectedItems.contains(product) ? Color.primaryColor : Color.gray.opacity(0.2), lineWidth: selectedItems.contains(product) ? 3 : 1)
                                        )
                                        .shadow(color: selectedItems.contains(product) ? .clear : .gray.opacity(0.05), radius: 28, x: 0, y: 4)
                                }
                                .buttonStyle(.plain)
                            }
                        }
                        .padding(.bottom, 20)
                        .padding([.top, .leading], 5)
                        .frame(alignment: .leading)
                    }
                }
                .padding(.horizontal, 40)
                .padding(.top, 40)
                
                if showingNotification {
                    NotificationsView()
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
    
    private func showSubview(view: AnyView) {
        withAnimation(.easeOut(duration: 0.3)) {
            currentSubview = view
            showingSubview = true
        }
    }
}

//struct ProductListView_Previews: PreviewProvider {
//    static var previews: some View {
//        NavigationView(products: Product.data)
//            .background(Background())
//            .frame(minWidth: 1728 / 1.5, minHeight: 1117 / 1.5)
//    }
//}
