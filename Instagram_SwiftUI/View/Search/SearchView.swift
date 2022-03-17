//
//  SearchView.swift
//  Instagram_SwiftUI
//
//  Created by Hayato Aoki on 3/11/22.
//

import SwiftUI

struct SearchView: View {
    
    @State var searchText = ""
    @State var isSearchMode = false
    @ObservedObject var vm = SearchViewModel()
    
    var body: some View {
        ScrollView{
            SearchBar(text: $searchText, isEditting: $isSearchMode)
                .padding()
            
            ZStack {
                if isSearchMode {
                    UserListView(vm: vm, searchText: $searchText)
                } else {
                    PostGridView(config: .explore)
                }
            }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(searchText: "")
    }
}
