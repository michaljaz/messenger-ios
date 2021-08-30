//
//  messengerApp.swift
//  messenger
//
//  Created by Michał Jażdżyk on 19/08/2021.
//

import SwiftUI
import Firebase
import GoogleSignIn
import FBSDKCoreKit
@main
struct messengerApp: App {
    @StateObject var viewModel = AuthViewModel()
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(viewModel)
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate
{
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool
    {
        ApplicationDelegate.shared.application(application, didFinishLaunchingWithOptions: launchOptions)
        FirebaseApp.configure()
        GIDSignIn.sharedInstance().clientID = FirebaseApp.app()?.options.clientID
        return true
    }
}
