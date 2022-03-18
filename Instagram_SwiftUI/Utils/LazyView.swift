//
//  LazyView.swift
//  Instagram_SwiftUI
//
//  Created by Hayato Aoki on 3/17/22.
//

import SwiftUI

struct LazyView<Content: View>: View {
    let build: () -> Content
    
    init(_ build: @autoclosure @escaping() -> Content){
        self.build = build
    }
    
    var body: Content {
        build()
    }
}
