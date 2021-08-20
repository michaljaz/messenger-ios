	//
//  ContentView.swift
//  messenger
//
//  Created by Michał Jażdżyk on 19/08/2021.
//

import SwiftUI

struct ContentView: View {
    @State private var showDetails = false
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                NavigationLink(
                    destination: Text("LUL"),
                    label:{
                        Text("xd")
                    }
                )
                Button("show details"){
                    showDetails.toggle()
                }
                if showDetails {
                    Text("Super text").font(.largeTitle)
                }
            }.navigationTitle("Messenger APP").navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
