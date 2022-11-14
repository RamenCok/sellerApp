//
//  NotificationItemView.swift
//  FitzeSeller
//
//  Created by Stephen Giovanni Saputra on 09/11/22.
//

import SwiftUI

struct NotificationItemView: View {
    
    var isNotifNew: Bool
    var notificationIndicator: String
    
    var body: some View {
        
        VStack(alignment: .trailing, spacing: 18) {
            HStack(alignment: .center, spacing: 16) {
                
                // New Notification Indicator
                Circle()
                    .foregroundColor(isNotifNew ? .red : .clear)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 14)
                
                // Good or Bad Notification Indicator
                Image(systemName: notificationIndicator == "Good" ? "checkmark.circle" : "exclamationmark.circle")
                    .font(.system(size: 36, weight: .semibold))
                    .foregroundColor(notificationIndicator == "Good" ? .green : .red)
                
                // Notificaton Content
                Text("Your product Lela Textured A-line Dress is published to Live.")
                    .font(.custom("Sora-Regular", size: 20))
                    .foregroundColor(.black)
                    .lineLimit(2)
                    .frame(width: 312)
            }
            
            Divider()
                .foregroundColor(.gray)
                .frame(width: 400)
        }
    }
}
