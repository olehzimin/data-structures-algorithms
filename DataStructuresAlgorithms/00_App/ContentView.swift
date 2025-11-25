//
//  ContentView.swift
//  DataStructuresAlgorithms
//
//  Created by Oleh Zimin on 23.11.2025.
//

import SwiftUI

// ContenView is used only for purpose of onAppear modifier to simulate console style environment.
// It runs code as soon as the UI loads, so it is possible to print to the Xcode console.
struct ContentView: View {
    @State private var hasExecuted = false
    
    var body: some View {
        ZStack {
            Color.teal
                .ignoresSafeArea()
            
            Text("All the code will be executred onAppear and shown in Console.")
                .font(.title2)
                .padding()
        }
        .onAppear {
            if !hasExecuted {
                runOnAppear()
                hasExecuted = true
            }
        }
    }
}

#Preview {
    ContentView()
}
