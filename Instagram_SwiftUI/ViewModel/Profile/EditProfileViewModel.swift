//
//  EditProfileViewModel.swift
//  Instagram_SwiftUI
//
//  Created by Hayato Aoki on 3/17/22.
//

import SwiftUI

class EditProfileViewModel: ObservableObject {
    var user: User
    @Published var uploadComplete = false
    
    init(user: User){
        self.user = user
    }
    
    func saveUserDate(_ bio: String) {
        guard let uid = user.id else { return }
        
        COLLECTION_USERS.document(uid).updateData(["bio": bio]) { _ in
            self.user.bio = bio
            self.uploadComplete = true
        }
    }
}
