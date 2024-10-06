//
//  UserListView.swift
//  BucketList
//
//  Created by Matthew Kruse on 10/6/24.
//

import SwiftUI

struct UserListView: View {
    
    enum LoadingState {
        case loading, success, failed
    }
    
    @State private var loadingState = LoadingState.loading

    
    let users = [
        User(firstName: "Arnold", lastName: "Rimmer"),
        User(firstName: "Kristine", lastName: "Kochanski"),
        User(firstName: "David", lastName: "Lister"),
    ]
        .sorted()
    
    
    var body: some View {
        VStack {
            Spacer()
            Text("App Documents Directory:\n \(URL.documentsDirectory)")
                .padding()
                .fontWidth(.compressed)

            Spacer(minLength: 50)
            Text("Sorted Users:")
            List(users) { user in
                Text("\(user.lastName), \(user.firstName)")
            }
            
            Spacer()
            
            switch loadingState {
            case .loading:
                LoadingView()
            case .success:
                SuccessView()
            case .failed:
                FailedView()
            }
            
            Spacer()

            
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
            Spacer()
        }
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
}

#Preview {
    UserListView()
}
