//
//  FeedViewModel.swift
//  Instagram_SwiftUI
//
//  Created by Hayato Aoki on 3/16/22.
//

import SwiftUI

class FeedViewModel: ObservableObject {
    @Published var posts = [Post]()
    
    init() {
        fetchPosts()
    }
    
    func fetchPosts() {
        COLLECTION_POSTS.getDocuments { snapShot, _ in
            guard let documents = snapShot?.documents else { return }
            self.posts = documents.compactMap({ try? $0.data(as: Post.self) })
            
            print(self.posts)
        }
    }
}
