	//
//  ContentView.swift
//  messenger
//
//  Created by Michał Jażdżyk on 19/08/2021.
//

import SwiftUI
import MaterialComponents.MaterialButtons
    
struct FloatingActionButton: UIViewRepresentable {
    let title: String

    init(_ title: String) {
        self.title = title
    }
    
    func makeUIView(context: Context) -> MDCFloatingButton {
        return MDCFloatingButton(shape: .default)
    }
    
    func updateUIView(_ uiView: MDCFloatingButton, context: Context) {
        uiView.setTitle(title, for: .normal)
    }
}
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
                FloatingActionButton("+").fixedSize().padding()
            }.navigationTitle("Choose sign in option").navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
