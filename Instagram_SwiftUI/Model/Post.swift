//
//  Post.swift
//  Instagram_SwiftUI
//
//  Created by Hayato Aoki on 3/16/22.
//

import FirebaseFirestoreSwift
import Firebase

struct Post: Identifiable, Decodable {
    @DocumentID var id: String?
    let ownerUid: String
    let ownerUserName: String
    let caption: String
    var likes: Int
    let imageUrl: String
    let timeStamp: Timestamp
    let ownerImageUrl: String
    
    var didLike: Bool? = false
}
