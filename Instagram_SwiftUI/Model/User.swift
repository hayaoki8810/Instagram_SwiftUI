//
//  User.swift
//  Instagram_SwiftUI
//
//  Created by Hayato Aoki on 3/15/22.
//

import Foundation
import FirebaseFirestoreSwift

struct User: Identifiable, Decodable {
    let userName: String
    let email: String
    let profileImageUrl: String
    let fullName: String
    @DocumentID var id: String?
    var bio: String?
    var stats: UserStats?
    var isFollowed: Bool? = false
    
    var isCurrentUser: Bool { return AuthViewModel.shared.userSession?.uid == id } 
}

struct UserStats: Decodable {
    var following: Int
    var posts: Int
    var followers: Int
}
