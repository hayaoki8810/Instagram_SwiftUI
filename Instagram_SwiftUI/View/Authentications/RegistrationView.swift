//
//  RegistrationView.swift
//  Instagram_SwiftUI
//
//  Created by Hayato Aoki on 3/15/22.
//

import SwiftUI

struct RegistrationView: View {
    @State var email = ""
    @State var fullName = ""
    @State var userName = ""
    @State var password = ""
    
    @State private var selectedImage: UIImage?
    @State var image: Image?
    
    @State var imagePickerPresented = false
    
    @EnvironmentObject var vm: AuthViewModel
    @Environment(\.presentationMode) var mode
    
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color.purple, Color.blue]), startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                VStack {
                    ZStack {
                        if let image = image {
                            image
                                .resizable()
                                .scaledToFit()
                                .frame(width: 140, height: 140)
                                .clipShape(Circle())
                            
                        } else {
                            Button(action: { imagePickerPresented.toggle() }, label: {
                                Image(systemName: "person.crop.circle.fill")
                                    .renderingMode(.template)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 140, height: 140)
                                    .foregroundColor(.white)
                            }).sheet(isPresented: $imagePickerPresented, onDismiss: loadImage, content: { ImagePicker(image: $selectedImage) })
                        }
                    }
                    
                    VStack(spacing: 20) {
                        // email
                        CustomTextField(text: $email, placeholder: Text("Email"), imageName: "envelope")
                            .textInputAutocapitalization(.never)
                            .padding()
                            .background(Color(.init(white: 1, alpha: 0.15)))
                            .cornerRadius(10)
                            .foregroundColor(.white)
                            .padding(.horizontal, 32)
                        
                        // email
                        CustomTextField(text: $fullName, placeholder: Text("Full Name"), imageName: "person")
                            .padding()
                            .background(Color(.init(white: 1, alpha: 0.15)))
                            .cornerRadius(10)
                            .foregroundColor(.white)
                            .padding(.horizontal, 32)
                        
                        // email
                        CustomTextField(text: $userName, placeholder: Text("User Name"), imageName: "person")
                            .padding()
                            .background(Color(.init(white: 1, alpha: 0.15)))
                            .cornerRadius(10)
                            .foregroundColor(.white)
                            .padding(.horizontal, 32)
                        
                        // password field
                        CustomeSecureField(text: $password, placeholder: Text("Password"))
                            .textInputAutocapitalization(.never)
                            .padding()
                            .background(Color(.init(white: 1, alpha: 0.15)))
                            .cornerRadius(10)
                            .foregroundColor(.white)
                            .padding(.horizontal, 32)
                        
                        //sign in
                        Button(action: {
                            vm.register(withEmail: email, passowrd: password, image: selectedImage, fullName: fullName, userName: userName)
                        }, label: {
                            Text("Sign Up")
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
            }
        }.navigationBarBackButtonHidden(true)
    }
}

extension RegistrationView {
    func loadImage() {
        guard let selectedImage = selectedImage else { return }
        image = Image(uiImage: selectedImage)
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
