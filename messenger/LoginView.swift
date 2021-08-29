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
    @State var manager = LoginManager()
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                
                // 2
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
                    manager.logIn(permissions:["public_profile","email"],from:nil) { (result,err) in
                        if err != nil {
                            print(err!.localizedDescription)
                            return
                        }
                        
                        //logged success...
                        
                        let request = GraphRequest(graphPath:"me",parameters: ["fields":"email"])
                        
                        request.start { (_, res, _) in
                            guard let profileData = res as? [String : Any] else { return }
                            print(profileData["email"] as! String)
                        }
                    }
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
