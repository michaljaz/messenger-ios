//
//  LoginView.swift
//  messenger
//
//  Created by Michał Jażdżyk on 28/08/2021.
//

import SwiftUI

struct LoginView: View {

  // 1
  @EnvironmentObject var viewModel: AuthViewModel

  var body: some View {
    VStack {
      Spacer()

      // 2
      Image("header_image")
        .resizable()
        .aspectRatio(contentMode: .fit)

      Text("Welcome to Ellifit!")
        .fontWeight(.black)
        .foregroundColor(Color(.systemIndigo))
        .font(.largeTitle)
        .multilineTextAlignment(.center)

      Text("Empower your elliptical workouts by tracking every move.")
        .fontWeight(.light)
        .multilineTextAlignment(.center)
        .padding()

      Spacer()

      // 3
      Button("Sign in with Google") {
        viewModel.signIn()
      }
      .buttonStyle(AuthenticationButtonStyle())
    }
  }
}

// 4
struct AuthenticationButtonStyle: ButtonStyle {
  func makeBody(configuration: Self.Configuration) -> some View {
    configuration.label
      .foregroundColor(.white)
      .padding()
      .frame(maxWidth: .infinity)
      .background(Color(.systemIndigo))
      .cornerRadius(12)
      .padding()
  }
}
