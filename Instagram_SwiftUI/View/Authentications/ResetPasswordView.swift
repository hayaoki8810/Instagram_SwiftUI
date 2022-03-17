//
//  ResetPasswordView.swift
//  Instagram_SwiftUI
//
//  Created by Hayato Aoki on 3/15/22.
//

import SwiftUI

struct ResetPasswordView: View {
    @EnvironmentObject var vm: AuthViewModel
    @Environment(\.presentationMode) var mode
    @Binding private var email: String
    
    init(email: Binding<String>) {
        self._email = email
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color.purple, Color.blue]), startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                
                VStack {
                    Image("instagramNameLogo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 220, height: 100)
                        .foregroundColor(.white)
                    
                    
                    // email
                    CustomTextField(text: $email, placeholder: Text("Email"), imageName: "envelope")
                        .textInputAutocapitalization(.never)
                        .padding()
                        .background(Color(.init(white: 1, alpha: 0.15)))
                        .cornerRadius(10)
                        .foregroundColor(.white)
                        .padding(.horizontal, 32)
                    
                    //sign in
                    Button(action: {
                        vm.resetPassword(withEmail: email)
                    }, label: {
                        Text("Send Link")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(width: 360, height: 50)
                            .background(Color.purple)
                            .clipShape(Capsule())
                            .padding()
                    })
                    
                    Spacer()
                    
                    // go to singn up
                    
                    Button(action: { mode.wrappedValue.dismiss() }, label: {
                        HStack {
                            Text("Already have an account?")
                                .font(.system(size: 14))
                            
                            Text("Sign In")
                                .font(.system(size: 14, weight: .semibold))
                        }.foregroundColor(.white)
                    }).padding(.bottom, 32)
                }
            }
        }.navigationBarBackButtonHidden(true)
            .onReceive(vm.$didSendResetPasswordLink, perform: { _ in
                self.mode.wrappedValue.dismiss()
            })
    }
}

