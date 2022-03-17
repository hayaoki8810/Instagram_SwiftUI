//
//  UserCellView.swift
//  Instagram_SwiftUI
//
//  Created by Hayato Aoki on 3/12/22.
//

import SwiftUI
import Kingfisher

struct UserCellView: View {
    let user: User
    
    var body: some View {
        HStack {
            // Image
            KFImage(URL(string: user.profileImageUrl))
                .resizable()
                .scaledToFit()
                .frame(width: 48, height: 48)
                .clipShape(Circle())
            
            // VStack -> UserName, FullName
            VStack(alignment: .leading) {
                Text(user.userName)
                    .font(.system(size: 14, weight: .semibold))
                
                Text(user.fullName)
                    .font(.system(size: 14))
            }
            Spacer()
        }
    }
}
