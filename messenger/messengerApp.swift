//
//  messengerApp.swift
//  messenger
//
//  Created by Michał Jażdżyk on 19/08/2021.
//

import SwiftUI
import Firebase
import GoogleSignIn

@main
struct messengerApp: App {
    @StateObject var viewModel = AuthViewModel()
    
    init(){
        setupAuthentication()
    }
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(viewModel)
        }
    }
}
extension messengerApp {
  private func setupAuthentication() {
    FirebaseApp.configure()
    GIDSignIn.sharedInstance().clientID = FirebaseApp.app()?.options.clientID
  }
}
