//
//  HomeView.swift
//  messenger
//
//  Created by Michał Jażdżyk on 28/08/2021.
//

import SwiftUI
import Firebase

struct HomeView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    
    private let user = Auth.auth().currentUser
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {

                    NetworkImage(url: user?.photoURL)
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100, height: 100, alignment: .center)
                        .cornerRadius(8)
                    
                    VStack(alignment: .leading) {
                        Text(user?.displayName ?? "")
                            .font(.headline)
                        
                        Text(user?.email ?? "")
                            .font(.subheadline)
                    }
                    
                    Spacer()
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color(.secondarySystemBackground))
                .cornerRadius(12)
                .padding()
                
                Spacer()
                
                // 4
                Button("Sign out") {
                    viewModel.signOut()
                }
                .buttonStyle(AuthenticationButtonStyle())
            }
            .navigationTitle("Messenger")
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

/// A generic view that is helpful for showing images from the network.
struct NetworkImage: View {
    let url: URL?
    
    var body: some View {
        if let url = url,
           let data = try? Data(contentsOf: url),
           let uiImage = UIImage(data: data) {
            Image(uiImage: uiImage)
                .resizable()
                .aspectRatio(contentMode: .fit)
        } else {
            Image(systemName: "person.circle.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
        }
    }
}
