//
//  EditProfileView.swift
//  Instagram_SwiftUI
//
//  Created by Hayato Aoki on 3/17/22.
//

import SwiftUI

struct EditProfileView: View {
    @State private var bioText: String
    @ObservedObject private var vm: EditProfileViewModel
    @Binding var user: User
    @Environment(\.presentationMode) var mode
    
    init(user: Binding<User>) {
        self._user = user
        self.vm = EditProfileViewModel(user: self._user.wrappedValue)
        self._bioText = State(initialValue: _user.wrappedValue.bio ?? "")
    }
    
    var body: some View {
        VStack {
            HStack {
                Button(action: { mode.wrappedValue.dismiss() }, label: {
                    Text("Cancel")
                })
                Spacer()
                
                Button(action: { vm.saveUserDate(bioText) }, label: {
                    Text("Done")
                        .bold()
                })
            }.padding()
            
            TextArea(placeholder: "Add your bio ...", text: $bioText)
                .frame(width: 370, height: 200)
                .padding()
            
            Spacer()
        }
        .onReceive(vm.$uploadComplete, perform: { completed in
            if completed {
                self.mode.wrappedValue.dismiss()
                self.user.bio = vm.user.bio
            }
        })
    }
}
