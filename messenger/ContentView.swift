	//
//  ContentView.swift
//  messenger
//
//  Created by Michał Jażdżyk on 19/08/2021.
//

import SwiftUI

struct ContentView: View {
    @State private var email: String=""
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                NavigationLink(
                    destination: VStack(alignment: .leading) {
                        Text("Here you will sign in with email")
                        TextField("Enter your email",text:$email)
                        Text("Hello \(email)")
                    }.navigationTitle("Sign in with email").navigationBarTitleDisplayMode(.inline),
                    label:{
                        Text("Continue with email")
                        .padding()
                        .background(Color(red: 0, green: 0, blue: 0.5))
                        .clipShape(Capsule())
                    }
                )
            }.navigationTitle("Choose sign in option").navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
