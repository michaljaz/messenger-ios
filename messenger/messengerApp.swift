//
//  messengerApp.swift
//  messenger
//
//  Created by Michał Jażdżyk on 19/08/2021.
//

import SwiftUI
import Firebase

@main
struct messengerApp: App {
    init(){
        FirebaseApp.configure()
        Auth.auth().createUser(withEmail:"xd@xd.pl",password:"aqq123")
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
