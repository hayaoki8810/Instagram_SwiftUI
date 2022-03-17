//
//  NotificationCell.swift
//  Instagram_SwiftUI
//
//  Created by Hayato Aoki on 3/12/22.
//

import SwiftUI
import Kingfisher

struct NotificationCell: View {
    
    @ObservedObject var vm: NotificationCellViewModel
    
    var isFollowed: Bool { return vm.notification.isFollowed ?? false }
    
    init(vm: NotificationCellViewModel) {
        self.vm = vm
    }
    
    @State private var showPostImage = false
    
    var body: some View {
        HStack {
            if let user = vm.notification.user {
                NavigationLink(destination: ProfileView(user: user), label: {
                    KFImage(URL(string: vm.notification.profileImageUrl))
                        .resizable()
                        .scaledToFit()
                        .frame(width: 40, height: 40)
                        .clipShape(Circle())
                    
                    Text(vm.notification.userName)
                        .font(.system(size: 14, weight: .semibold)) +
                    Text(" \(vm.notification.type.notificationMessage)")
                        .font(.system(size: 15)) +
                    Text("\(vm.timestampString)")
                        .foregroundColor(.gray)
                        .font(.system(size: 12))
                })
            }
            
            Spacer()
            
            if vm.notification.type != .follow {
                if let post = vm.notification.post {
                    NavigationLink(destination: FeedCell(vm: FeedCellViewModel(post: post)), label: {
                        KFImage(URL(string: post.imageUrl))
                            .resizable()
                            .scaledToFill()
                            .frame(width: 40, height: 40)
                            .clipped()
                    })
                }
            } else {
                Button(action: {
                    isFollowed ? vm.unfollow() : vm.follow()
                }, label: {
                    Text(isFollowed ? "Following" : "Follow")
                        .font(.system(size: 14, weight: .semibold))
                        .frame(width: 90, height: 32)
                        .foregroundColor(isFollowed ? .black : .white)
                        .background(isFollowed ? Color.white : Color.blue)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.gray, lineWidth: isFollowed ? 1 : 0)
                        )
                })
            }
            
        }.padding(.horizontal)
    }
}
