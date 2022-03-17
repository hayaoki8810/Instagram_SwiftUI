//
//  FeedCell.swift
//  Instagram_SwiftUI
//
//  Created by Hayato Aoki on 3/11/22.
//

import SwiftUI
import Kingfisher

struct FeedCell: View {
    @ObservedObject var vm: FeedCellViewModel
    
    var didLike: Bool { return vm.post.didLike ?? false }
    
    init(vm: FeedCellViewModel){
        self.vm = vm
    }
    
    var body: some View {
        VStack(alignment: .leading){
            HStack {
                KFImage(URL(string: vm.post.ownerImageUrl))
                    .resizable()
                    .scaledToFit()
                    .frame(width: 36, height: 36)
                    .clipped()
                    .cornerRadius(18)
                
                Text(vm.post.ownerUserName)
                    .font(.system(size: 14, weight: .semibold))
            }.padding([.leading, .bottom], 8)
            
            // post image
            KFImage(URL(string: vm.post.imageUrl))
                .resizable()
                .scaledToFit()
                .frame(maxHeight: 440)
                .clipped()
            
            // action buttons
            HStack(spacing: 16){
                Button(action: {
                    vm.post.didLike! ? vm.unlike() : vm.like()
                }, label: {
                    Image(systemName: didLike ? "heart.fill" : "heart")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(didLike ? .red: .black)
                        .frame(width: 20, height: 20)
                        .font(.system(size: 20))
                        .clipped()
                        .padding(4)
                })
                
                NavigationLink(destination: CommentsView(post: vm.post), label: {
                    Image(systemName: "bubble.right")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 20)
                        .font(.system(size: 20))
                        .padding(4)
                })
                
                Button(action: {}, label: {
                    Image(systemName: "paperplane")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 20)
                        .font(.system(size: 20))
                        .clipped()
                        .padding(4)
                })
            }
            .padding(.leading, 4)
            .foregroundColor(.black)
            
            // captions
            Text(vm.likeString)
                .font(.system(size: 14, weight: .semibold))
                .padding(.leading, 8)
                .padding(.bottom, 2)
            
            HStack {
                Text(vm.post.ownerUserName)
                    .font(.system(size: 14, weight: .semibold))
                +
                Text(" ")
                +
                Text("\(vm.post.caption)")
                    .font(.system(size: 15))
            }
            .padding(.horizontal, 8)
            
            Text(vm.timestampString)
                .font(.system(size: 14))
                .foregroundColor(.gray)
                .padding(.leading, 8)
                .padding(.top, -2)
        }
    }
}
