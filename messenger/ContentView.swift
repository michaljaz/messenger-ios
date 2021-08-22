	//
//  ContentView.swift
//  messenger
//
//  Created by Michał Jażdżyk on 19/08/2021.
//

import SwiftUI
import MaterialComponents.MaterialButtons
    
struct MaterialButton: UIViewRepresentable {
    let title: String
    let background: UIColor

    init(_ title: String,_ background: UIColor) {
        self.title = title
        self.background=background
    }
    
    func makeUIView(context: Context) -> MDCButton {
        return MDCButton()
    }
    
    func updateUIView(_ uiView: MDCButton, context: Context) {
        uiView.setTitle(title, for: .normal)
        uiView.backgroundColor=background
    }
}
struct ContentView: View {
    @State private var email: String=""
    var body: some View {
        NavigationView {
            VStack(alignment: .center) {
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
                MaterialButton("Continue with google",UIColor.red).fixedSize(horizontal: false, vertical: true).padding(2)
                MaterialButton("Continue with facebook",UIColor.blue).fixedSize(horizontal: false, vertical: true).padding(2)
            }.navigationTitle("Choose sign in option").navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
