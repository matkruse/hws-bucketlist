//
//  ContentView.swift
//  BucketList
//
//  Created by Matthew Kruse on 10/6/24.
//

import LocalAuthentication
import SwiftUI

struct ContentView: View {
    @State private var isUnlocked = false
    
    var body: some View {
        VStack {
            if isUnlocked {
                Text("Unlocked")
            } else {
                Text("Locked")
            }
        }
        .onAppear(perform: authenticate)
        
        NavigationStack {
            
            VStack {
                Spacer()
                NavigationLink(destination: UserListView() ) {
                    Text("Lesson Stuff")
                }
                Spacer()
                NavigationLink(destination: MapView() ) {
                    Text("Lesson Map")
                }
                Spacer()
            }
        }
    }
    
    func authenticate() {
        let context = LAContext()
        var error: NSError?
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            let reason = "We need to unlock your data."
            
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) {
                success, authenticationError in
                if success {
                    isUnlocked = true
                } else {
                    // there was a problem todo: build fallback for cases when face id fails
                }
            }
        } else {
            // no biometrics
        }
    }
}

#Preview {
    ContentView()
}
