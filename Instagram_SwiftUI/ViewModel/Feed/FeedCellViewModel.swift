//
//  FeedCellViewModel.swift
//  Instagram_SwiftUI
//
//  Created by Hayato Aoki on 3/16/22.
//

import SwiftUI

class FeedCellViewModel: ObservableObject {
    @Published var post: Post
    
    var likeString: String {
        let label = post.likes == 1 ? "like" : "likes"
        return "\(post.likes) \(label)"
    }
    
    var timestampString: String {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.second, .minute, .hour, .day, .weekOfMonth]
        formatter.maximumUnitCount = 1
        formatter.unitsStyle = .abbreviated
        return formatter.string(from: post.timeStamp.dateValue(), to: Date()) ?? ""
    }
    
    init(post: Post){
        self.post = post
        checkIfUserLikedPost()
    }
    
    func like() {
        guard let uid = AuthViewModel.shared.userSession?.uid else { return }
        guard let postId = post.id else { return }
        COLLECTION_POSTS.document(postId).collection("post-likes")
        COLLECTION_USERS.document(uid).collection("user-likes")
            .document(postId).setData([:]){ _ in
                
                COLLECTION_POSTS.document(postId).updateData(["likes": self.post.likes + 1])
                
                NotificationViewModel.uploadNotifications(toUid: self.post.ownerUid, type: .like, post: self.post)
                
                self.post.didLike = true
                self.post.likes += 1
            }
    }
    
    func unlike() {
        guard post.likes > 0 else { return }
        guard let uid = AuthViewModel.shared.userSession?.uid else { return }
        guard let postId = post.id else { return }
        
        COLLECTION_POSTS.document(postId).collection("post-likes").document(uid).delete { _ in
            COLLECTION_USERS.document(uid).collection("user-likes").document(postId).delete { _ in
                COLLECTION_POSTS.document(postId).updateData(["likes": self.post.likes - 1])
                
                self.post.didLike = false
                self.post.likes -= 1
            }
        }
    }
    
    func checkIfUserLikedPost(){
        guard let uid = AuthViewModel.shared.userSession?.uid else { return }
        guard let postId = post.id else { return }
        
        COLLECTION_USERS.document(uid).collection("user-likes").document(postId).getDocument { snapShot, _ in
            guard let didLike = snapShot?.exists else { return }
            self.post.didLike = didLike
        }
    }
}
