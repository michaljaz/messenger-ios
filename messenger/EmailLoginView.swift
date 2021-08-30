//
//  EmailLoginView.swift
//  messenger
//
//  Created by Michał Jażdżyk on 30/08/2021.
//

import SwiftUI
import Firebase

struct EmailLoginView: View {
    @State private var email: String=""
    @State private var password: String=""
    var body: some View {
        VStack(alignment: .center) {
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
        }.navigationTitle("Sign in with email").navigationBarTitleDisplayMode(.inline)
    }
}

struct EmailLoginView_Previews: PreviewProvider {
    static var previews: some View {
        EmailLoginView()
    }
}
