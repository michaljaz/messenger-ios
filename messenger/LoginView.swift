//
//  LoginView.swift
//  messenger
//
//  Created by Michał Jażdżyk on 28/08/2021.
//

import SwiftUI
import Firebase
import FBSDKLoginKit

struct LoginView: View {
    @State private var email: String=""
    @State private var password: String=""
    @EnvironmentObject var viewModel: AuthViewModel
    
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                
                Image("header_image")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                Text("Welcome to Messenger!")
                    .fontWeight(.black)
                    .foregroundColor(Color(.systemIndigo))
                    .font(.largeTitle)
                    .multilineTextAlignment(.center)
                
                Spacer()
                
                NavigationLink(
                    destination: VStack(alignment: .center) {
                        TextField("Enter your email",text:$email).autocapitalization(.none).disableAutocorrection(true)
                        SecureField("Enter your password",text:$password).disableAutocorrection(true)
                        Button("Sign in"){
                            Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                                print(authResult as Any)
                            }
                        }
                        Button("Register"){
                            print(email,password)
                            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                                print(authResult as Any)
                            }
                        }
                    }.navigationTitle("Sign in with email").navigationBarTitleDisplayMode(.inline),
                    label:{
                        Text("Continue with email").buttonStyle(AuthenticationButtonStyle())
                    }
                )
                
                Button("Continue with Google") {
                    viewModel.continueWithGoogle()
                }.buttonStyle(AuthenticationButtonStyle())
                
                Button("Continue with Facebook") {
                    viewModel.continueWithFacebook()
                }.buttonStyle(AuthenticationButtonStyle())
            }
        }
    }
}

// 4
struct AuthenticationButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .foregroundColor(.white)
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color(.systemIndigo))
            .cornerRadius(12)
            .padding()
    }
}
