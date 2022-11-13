//
//  MainView.swift
//  FitzeSeller
//
//  Created by Kevin Harijanto on 09/11/22.
//

import SwiftUI

class CurrentMainView: ObservableObject {
    enum CurrentMainView: Int {
        case live
        case onreview
        case emptystate
    }
    
    @Published var switchMainView = CurrentMainView.live
}


struct MainView: View {
    @StateObject var currentMainView = CurrentMainView()
    @State var cards: [Card]
    @State var items = ["Live", "On Review", "Need Action", "Archived", "Draft"]
    
    var body: some View {
        NavigationView {
            List {
                Button {
                    currentMainView.switchMainView = .live
                } label: {
                    Text("Live")
                }.buttonStyle(.borderless)
                
                Button {
                    currentMainView.switchMainView = .onreview
                } label: {
                    Text("On Review")
                }.buttonStyle(.borderless)
                
                Button {
                    currentMainView.switchMainView = .emptystate
                } label: {
                    Text("Grid Picker")
                }.buttonStyle(.borderless)
            }
            .listStyle(.sidebar)
            
            switch (currentMainView.switchMainView) {
            case .live:
                ProductListView(ListName: items[0], cards: $cards)
                    .onAppear {self.cards = Card.data.filter { $0.tag == items[0] }}
            case .onreview:
                ProductListView(ListName: items[1], cards: $cards)
                    .onAppear {self.cards = Card.data.filter { $0.tag == items[1] }}
            case .emptystate:
                EmptyState()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(cards: Card.data)
            .background(Background())
            .frame(minWidth: 1728 / 1.5, minHeight: 1117 / 1.5)
    }
}
