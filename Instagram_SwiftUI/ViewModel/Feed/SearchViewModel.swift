//
//  SearchViewModel.swift
//  Instagram_SwiftUI
//
//  Created by Hayato Aoki on 3/15/22.
//

import Foundation

class SearchViewModel: ObservableObject {
    @Published var users = [User]()
    
    init() {
        fetchUsers()
    }
    
    func fetchUsers() {
        COLLECTION_USERS.getDocuments { snapShot, _ in
            guard let documents = snapShot?.documents else { return }
            
            documents.forEach { snapShot in
                guard let user = try? snapShot.data(as: User.self) else { return }
                self.users.append(user)
            }
        }
    }
    
    func filteredUsers(_ query: String) -> [User] {
        let lowerCasedQuery = query.lowercased()
        return users.filter({ $0.fullName.lowercased().contains(lowerCasedQuery) || $0.userName.contains(lowerCasedQuery) })
    }
}
