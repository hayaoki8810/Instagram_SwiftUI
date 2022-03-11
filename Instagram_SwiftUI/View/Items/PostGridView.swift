//
//  PostGridView.swift
//  Instagram_SwiftUI
//
//  Created by Hayato Aoki on 3/11/22.
//

import SwiftUI

struct PostGridView: View {
    
    private let items = [GridItem(), GridItem(), GridItem()]
    private let width = UIScreen.main.bounds.width / 3
    var body: some View {
        LazyVGrid(columns: items, spacing: 2, content: {
            ForEach(0 ..< 10) { item in
                Image("beautifulImage")
                    .resizable()
                    .scaledToFit()
                    .frame(width: width, height: width)
                .clipped()
            }
        })
    }
}

struct PostGridView_Previews: PreviewProvider {
    static var previews: some View {
        PostGridView()
    }
}
