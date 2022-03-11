//
//  FeedView.swift
//  Instagram_SwiftUI
//
//  Created by Hayato Aoki on 3/11/22.
//

import SwiftUI

struct FeedView: View {
    var body: some View {
        ScrollView{
            LazyVStack(spacing: 32){
                ForEach(0 ..< 20) { _ in
                    FeedCell()
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
