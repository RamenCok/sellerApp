//
//  NotificationsView.swift
//  FitzeSeller
//
//  Created by Stephen Giovanni Saputra on 09/11/22.
//

import SwiftUI


struct NotificationsView: View {
    
    let screen = NSScreen.main?.visibleFrame
    
    var body: some View {
        
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 18) {
                
                NotificationItemView(isNotifNew: true, notificationIndicator: "Good")
                NotificationItemView(isNotifNew: false, notificationIndicator: "Bad")
                NotificationItemView(isNotifNew: true, notificationIndicator: "Good")
                NotificationItemView(isNotifNew: false, notificationIndicator: "Bad")
                NotificationItemView(isNotifNew: true, notificationIndicator: "Good")
                NotificationItemView(isNotifNew: false, notificationIndicator: "Bad")
                NotificationItemView(isNotifNew: true, notificationIndicator: "Good")
                NotificationItemView(isNotifNew: false, notificationIndicator: "Bad")
                NotificationItemView(isNotifNew: true, notificationIndicator: "Good")
                NotificationItemView(isNotifNew: false, notificationIndicator: "Bad")
            }
            .padding(40)
        }
        .frame(maxHeight: (screen?.height ?? 0) / 2.45, alignment: .center)
        .background(Color.white)
        .cornerRadius(26)
        .shadow(color: .gray.opacity(0.3), radius: 40, x: 0, y: 0)
    }
}

struct NotificationView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationsView()
            .previewLayout(.sizeThatFits)
    }
}
