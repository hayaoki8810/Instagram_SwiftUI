//
//  ProfileView.swift
//  Instagram_SwiftUI
//
//  Created by Hayato Aoki on 3/11/22.
//

import SwiftUI

struct ProfileView: View {
    let user: User
    @ObservedObject var vm: ProfileViewModel
    
    init(user: User){
        self.user = user
        self.vm = ProfileViewModel(user: user)
    }
    
    var body: some View {
        ScrollView {
            VStack(spacing: 32){
                ProfileHeaderView(vm: vm)
                PostGridView(config: .profile(user.id ?? ""))
            }.padding(.top)
        }
    }
}
