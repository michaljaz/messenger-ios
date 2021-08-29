//
//  ContentView.swift
//  messenger
//
//  Created by Michał Jażdżyk on 19/08/2021.
//

import SwiftUI
import Firebase

struct ContentView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        switch viewModel.state {
        case .signedIn: HomeView()
        case .signedOut: LoginView()
        }
    }
}
