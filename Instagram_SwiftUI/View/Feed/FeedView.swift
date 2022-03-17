//
//  FeedView.swift
//  Instagram_SwiftUI
//
//  Created by Hayato Aoki on 3/11/22.
//

import SwiftUI

struct FeedView: View {
    @ObservedObject var vm = FeedViewModel()
    
    var body: some View {
        ScrollView{
            LazyVStack(spacing: 32){
                ForEach(vm.posts) { post in
                    FeedCell(vm: FeedCellViewModel(post: post))
                }
            }.padding(.top)
        }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
