//
//  PostGridView.swift
//  Instagram_SwiftUI
//
//  Created by Hayato Aoki on 3/11/22.
//

import SwiftUI
import Kingfisher

struct PostGridView: View {
    
    private let items = [GridItem(), GridItem(), GridItem()]
    private let width = UIScreen.main.bounds.width / 3
    let config: PostGridConfiguration
    
    @ObservedObject var vm: PostGridViewModel
    
    init(config: PostGridConfiguration) {
        self.config = config
        self.vm = PostGridViewModel(config: config)
    }
    
    var body: some View {
        LazyVGrid(columns: items, spacing: 2, content: {
            ForEach(vm.posts) { post in
                NavigationLink(destination: {
                    FeedCell(vm: FeedCellViewModel(post: post))
                }, label: {
                    KFImage(URL(string: post.imageUrl))
                        .resizable()
                        .scaledToFit()
                        .frame(width: width, height: width)
                    .clipped()
                })
            }
        })
    }
}
