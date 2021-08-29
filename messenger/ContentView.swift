//
//  ContentView.swift
//  messenger
//
//  Created by Michał Jażdżyk on 19/08/2021.
//

import SwiftUI
import Firebase

//struct ContentView: View {
//    @State private var email: String=""
//    @State private var password: String=""
//    var body: some View {
//        NavigationView {
//            VStack(alignment: .center) {
//                NavigationLink(
//                    destination: VStack(alignment: .center) {
//                        TextField("Enter your email",text:$email).autocapitalization(.none).disableAutocorrection(true)
//                        SecureField("Enter your password",text:$password).disableAutocorrection(true)
//                        Button("Sign in"){
//                            Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
//                                print(authResult as Any)
//                            }
//                        }
//                        Button("Register"){
//                            print(email,password)
//                            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
//                                print(authResult as Any)
//                            }
//                        }
//                    }.navigationTitle("Sign in with email").navigationBarTitleDisplayMode(.inline),
//                    label:{
//                        MaterialButton("Continue with email",UIColor.orange).fixedSize(horizontal: false, vertical: true).padding(2)
//                    }
//                )
//                MaterialButton("Continue with google",UIColor.red).fixedSize(horizontal: false, vertical: true).padding(2)
//                MaterialButton("Continue with facebook",UIColor.systemBlue).fixedSize(horizontal: false, vertical: true).padding(2)
//            }.navigationTitle("Choose sign in option").navigationBarTitleDisplayMode(.inline)
//        }
//    }
//}
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}

struct ContentView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        switch viewModel.state {
        case .signedIn: HomeView()
        case .signedOut: LoginView()
        }
    }
}
