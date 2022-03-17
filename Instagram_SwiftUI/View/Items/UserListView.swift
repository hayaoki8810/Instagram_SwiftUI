//
//  UserListView.swift
//  Instagram_SwiftUI
//
//  Created by Hayato Aoki on 3/12/22.
//

import SwiftUI

struct UserListView: View {
    @ObservedObject var vm: SearchViewModel
    @Binding var searchText: String
    
    var users: [User] {
        return searchText.isEmpty ? vm.users : vm.filteredUsers(searchText)
    }
    
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(users) { user in
                    NavigationLink(
                    destination: LazyView(ProfileView(user: user)),
                    label: {
                        UserCellView(user: user)
                        .padding(.leading) }
                    )
                }
            }
        }
    }
}
