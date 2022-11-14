//
//  EmptyState.swift
//  FitzeSeller
//
//  Created by Kevin Harijanto on 11/11/22.
//

import SwiftUI

struct EmptyState: View {
    let tag: String
    
    var emptyTitle: String {
        switch tag {
        case "Need Action":
            return "Yay! You are all caught up"
        default:
            return "Oops! Nothing to see here.."
        }
    }
    var emptySubtitle: String {
        switch tag {
        case "Live":
            return "Start adding new products"
        case "On Review":
            return "None of your product is on review"
        case "Need Action":
            return "None of your product need revision"
        case "Archived":
            return "You don't have any archived product"
        case "Draft":
            return "You have no saved draft"
        default:
            return ""
        }
    }
    
    var body: some View {
        VStack {
            Image("emptystate")
            
            Text(emptyTitle)
                .font(.custom("Sora-Bold", size: 18))
                .foregroundColor(.lightGrey2)
            
            Text(emptySubtitle)
                .font(.custom("Sora-Regular", size: 16))
                .foregroundColor(.lightGrey2)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct EmptyState_Previews: PreviewProvider {
    static var previews: some View {
        EmptyState(tag: "Live")
            .background(Background())
            .frame(minWidth: 1728 / 1.5, minHeight: 1117 / 1.5)
    }
}
