//
//  SearchView.swift
//  Instagram_SwiftUI
//
//  Created by Hayato Aoki on 3/11/22.
//

import SwiftUI

struct SearchView: View {
    
    @State var searchText = ""
    
    var body: some View {
        ScrollView{
            SearchBar(text: $searchText)
                .padding()
            
            PostGridView()
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(searchText: "")
    }
}
