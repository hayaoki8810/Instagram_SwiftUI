//
//  ProfileActionButtonView.swift
//  Instagram_SwiftUI
//
//  Created by Hayato Aoki on 3/16/22.
//

import SwiftUI

struct ProfileActionButtonView: View {
    @ObservedObject var vm: ProfileViewModel
    var isFollowed: Bool { return vm.user.isFollowed ?? false }
    @State var showingEditProfile = false
    
    var body: some View {
        if vm.user.isCurrentUser {
            Button(action: { showingEditProfile.toggle() }, label: {
                Text("Edit Profile")
                    .font(.system(size: 14, weight: .semibold))
                    .frame(width: 360, height: 32)
                    .foregroundColor(.black)
                    .overlay(
                        RoundedRectangle(cornerRadius: 3)
                            .stroke(Color.gray, lineWidth: 1)
                    )
            }).sheet(isPresented: $showingEditProfile) {
                EditProfileView(user: $vm.user)
            }
        } else {
            HStack {
                Button(action: { isFollowed ? vm.unfollow() : vm.follow() }, label: {
                    Text(isFollowed ? "Following" : "Follow")
                        .font(.system(size: 14, weight: .semibold))
                        .frame(width: 172, height: 32)
                        .foregroundColor(isFollowed ? .black : .white)
                        .background(isFollowed ? Color.white : Color.blue)
                        .overlay(
                            RoundedRectangle(cornerRadius: 3)
                                .stroke(Color.gray, lineWidth: isFollowed ? 1 : 0)
                        )
                }).cornerRadius(3)
                
                Button(action: {}, label: {
                    Text("Message")
                        .font(.system(size: 14, weight: .semibold))
                        .frame(width: 172, height: 32)
                        .foregroundColor(.black)
                        .overlay(
                            RoundedRectangle(cornerRadius: 3)
                                .stroke(Color.gray, lineWidth: 1)
                        )
                })
            }
        }
    }
}
