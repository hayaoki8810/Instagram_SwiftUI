//
//  Extensions.swift
//  Instagram_SwiftUI
//
//  Created by Hayato Aoki on 3/12/22.
//

import UIKit

extension UIApplication {
    func endEditing(){
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
