//
//  ContentView.swift
//  Instagram_SwiftUI
//
//  Created by Hayato Aoki on 3/10/22.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var vm: AuthViewModel
    @State var selectedIndex = 0
    
    var body: some View {
        Group {
            if vm.userSession == nil {
                LoginView()
            } else {
                VStack {
                    if let user = vm.currentUser {
                        MainTabView(user: user, selectedIndex: $selectedIndex)
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
