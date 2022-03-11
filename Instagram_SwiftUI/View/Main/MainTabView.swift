//
//  MainTabView.swift
//  Instagram_SwiftUI
//
//  Created by Hayato Aoki on 3/11/22.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        NavigationView{
            TabView {
                FeedView()
                    .tabItem{
                        Image(systemName: "house")
                    }
                
                SearchView()
                    .tabItem{
                        Image(systemName: "magnifyingglass")
                    }
                
                UploadPostView()
                    .tabItem{
                        Image(systemName: "plus.square")
                    }
                
                NotificationView()
                    .tabItem{
                        Image(systemName: "heart")
                    }
                
                ProfileView()
                    .tabItem{
                        Image(systemName: "person")
                    }
            }
            .navigationTitle("Home")
            .navigationBarTitleDisplayMode(.inline)
            .accentColor(.black)
        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
