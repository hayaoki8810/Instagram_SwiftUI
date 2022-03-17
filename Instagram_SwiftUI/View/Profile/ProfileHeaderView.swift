//
//  ProfileHeaderView.swift
//  Instagram_SwiftUI
//
//  Created by Hayato Aoki on 3/12/22.
//

import SwiftUI
import Kingfisher

struct ProfileHeaderView: View {
    @ObservedObject var vm: ProfileViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                KFImage(URL(string: vm.user.profileImageUrl))
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80, height: 80)
                    .clipShape(Circle())
                    .padding(.leading)
                
                Spacer()
                
                HStack(spacing: 16) {
                    UserStatView(value: vm.user.stats?.posts ?? 0, title: "Posts")
                    UserStatView(value: vm.user.stats?.followers ?? 0, title: "Followers")
                    UserStatView(value: vm.user.stats?.following ?? 0, title: "Following")
                }.padding(.trailing, 32)
            }
            
            Text(vm.user.fullName)
                .font(.system(size: 15, weight: .semibold))
                .padding([.leading, .top])
            
            if let bio = vm.user.bio {
                Text(bio)
                    .font(.system(size: 15))
                    .padding(.leading)
                    .padding(.top, 1)
            }
            
            HStack {
                Spacer()
                ProfileActionButtonView(vm: vm)
                Spacer()
            }.padding(.top)
        }
    }
}

struct UserStatView: View {
    var value: Int
    var title: String
    
    var body: some View {
        VStack {
            Text("\(value)")
                .font(.system(size: 15, weight: .semibold))
            
            Text("\(title)")
                .font(.system(size: 15))
        }.frame(width: 80, alignment: .center)
    }
}
