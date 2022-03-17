//
//  CommentsView.swift
//  Instagram_SwiftUI
//
//  Created by Hayato Aoki on 3/16/22.
//

import SwiftUI

struct CommentsView: View {
    @State var commentText = ""
    @ObservedObject var vm: CommentViewModel
    
    init(post: Post) {
        self.vm = CommentViewModel(post: post)
    }
    
    var body: some View {
        VStack {
            // Comment Cells
            ScrollView {
                LazyVStack(alignment: .leading, spacing: 24) {
                    ForEach(vm.comments) { comment in
                        CommentCell(comment: comment)
                            .padding()
                    }
                }
            }.padding(.top)
            
            CustomInputView(inputText: $commentText, action: uploadComment)
            
            // input view
        }
    }
    
    func uploadComment() {
        vm.uploadComment(commentText: commentText)
        commentText = ""
    }
}

