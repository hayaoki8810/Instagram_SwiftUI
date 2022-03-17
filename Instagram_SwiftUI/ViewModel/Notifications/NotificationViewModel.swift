//
//  NotificationViewModel.swift
//  Instagram_SwiftUI
//
//  Created by Hayato Aoki on 3/16/22.
//

import SwiftUI
import Firebase

class NotificationViewModel: ObservableObject {
    @Published var notifications = [Notification]()
    
    init() {
        fetchNotifications()
    }
    
    func fetchNotifications() {
        guard let uid = AuthViewModel.shared.userSession?.uid else { return }
        
        let query = COLLECTION_NOTIFICATIONS.document(uid).collection("user-notifications")
            .order(by: "timeStamp", descending: true)
        
        query.getDocuments { snapShot, _ in
            guard let documents = snapShot?.documents else { return }
            self.notifications = documents.compactMap({ try? $0.data(as: Notification.self) })
            
            print(self.notifications)
        }
        
        let type = NotificationType(rawValue: 0)
    }
    
    static func uploadNotifications(toUid uid: String, type: NotificationType, post: Post? = nil) {
        guard let user = AuthViewModel.shared.currentUser else { return }
        guard uid != user.id else { return }
        
        var data: [String: Any] = [ "timeStamp": Timestamp(date: Date()),
                                    "userName": user.userName,
                                    "uid": user.id ?? "",
                                    "profileImageUrl": user.profileImageUrl,
                                    "type": type.rawValue ]
        
        if let post = post, let id = post.id {
            data["postId"] = id
        }
        
        COLLECTION_NOTIFICATIONS.document(uid).collection("user-notifications").addDocument(data: data)
    }
}
