//
//  ContentView.swift
//  BucketList
//
//  Created by Matthew Kruse on 10/6/24.
//  Compilation of lessons that proceed Project 14
//
//  Conformance to Comparable for custom types; User struct sorting
//  Writing data to the documents directory; write "Test Message" to "message.txt"
//  Switching view states with enums; conditions to display loading, success, or failed
//  Using Touch ID and Face ID with SwiftUI; Unlock data
//
//  Lesson
//  URL: https://www.hackingwithswift.com/books/ios-swiftui/integrating-mapkit-with-swiftui



import LocalAuthentication
import SwiftUI

struct ContentView: View {
    @State private var isUnlocked = false
    @State private var loadingState = LoadingState.loading

    enum LoadingState {
        case loading, success, failed
    }
    
    // sort list of users
    let users = [
        User(firstName: "Arnold", lastName: "Rimmer"),
        User(firstName: "Kristine", lastName: "Kochanski"),
        User(firstName: "David", lastName: "Lister"),
    ]
        .sorted()
    
    var body: some View {

        // display text depending on lock state
        VStack {
            if isUnlocked {
                Text("Unlocked")
            } else {
                Text("Locked")
            }

            Spacer()
            // Display where app directory sits
            Text("App Documents Directory:\n \(URL.documentsDirectory)")
                .padding()
                .fontWidth(.compressed)

            // List users sorted
            Spacer(minLength: 50)
            Text("Sorted Users:")
            List(users) { user in
                Text("\(user.lastName), \(user.firstName)")
            }
            
            Spacer()

            // Demonstrate a read and write
            Button("Read and Write") {
                let data = Data("Test Message B".utf8)
                let url = URL.documentsDirectory.appending(path: "message.txt")
                
                do {
                    try data.write(to: url, options: [.atomic, .completeFileProtection])
                    let input = try String(contentsOf: url, encoding: .utf8 )
                    print(input)
                } catch {
                    print(error.localizedDescription)
                }
                
            }

            Spacer(minLength: 30)
 
            switch loadingState {
            case .loading:
                LoadingView()
            case .success:
                SuccessView()
            case .failed:
                FailedView()
            }
           
            Spacer()
        }
        .onAppear(perform: authenticate)

    }

    struct LoadingView: View {
        var body: some View {
            Text("Loading...")
        }
    }

    struct SuccessView: View {
        var body: some View {
            Text("Success!")
        }
    }

    struct FailedView: View {
        var body: some View {
            Text("Failed.")
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
