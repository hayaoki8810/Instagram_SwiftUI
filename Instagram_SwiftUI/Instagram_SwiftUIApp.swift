//
//  Instagram_SwiftUIApp.swift
//  Instagram_SwiftUI
//
//  Created by Hayato Aoki on 3/10/22.
//

import SwiftUI
import Firebase

@main
struct Instagram_SwiftUIApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(AuthViewModel.shared)
        }
    }
}
