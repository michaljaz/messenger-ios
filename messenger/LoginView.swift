//
//  LoginView.swift
//  messenger
//
//  Created by Michał Jażdżyk on 28/08/2021.
//

import SwiftUI
import FBSDKLoginKit

struct LoginView: View {
   
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                
                Text("Welcome to Messenger!")
                    .fontWeight(.black)
                    .foregroundColor(Color(.systemIndigo))
                    .font(.largeTitle)
                    .multilineTextAlignment(.center)
                
                Spacer()
                NavigationLink(
                    destination: EmailLoginView(),
                    label:{
                        Text("Continue with email").foregroundColor(.black)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color(.systemYellow))
                            .cornerRadius(12)
                            .padding(.horizontal,15)
                            .padding(.vertical,2)
                    }
                )
                
                Button("Continue with Google") {
                    viewModel.continueWithGoogle()
                }.buttonStyle(AuthenticationButtonStyle(bgColor:Color(.systemRed)))
                
                Button("Continue with Facebook") {
                    viewModel.continueWithFacebook()
                }.buttonStyle(AuthenticationButtonStyle(bgColor:Color(.systemIndigo))).padding(.bottom,15)
               
            }
        }
    }
}

struct AuthenticationButtonStyle: ButtonStyle {
    var bgColor: Color
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .foregroundColor(.black)
            .padding()
            .frame(maxWidth: .infinity)
            .background(bgColor)
            .cornerRadius(12)
            .padding(.horizontal,15)
            .padding(.vertical,2)
    }
}
