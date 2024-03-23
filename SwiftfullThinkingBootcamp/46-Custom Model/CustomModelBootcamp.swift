//
//  CustomModelBootcamp.swift
//  SwiftfullThinkingBootcamp
//
//  Created by Furkan Açıkgöz on 23.03.2024.
//

import SwiftUI

struct User: Identifiable {
    let id: String = UUID().uuidString
    var name: String
    var username: String
    var followersCount: Int
    var isVerified: Bool
}

struct CustomModelBootcamp: View {
    
    @State var users: [User] = [
        User(name: "Furkan", username: "symb1od", followersCount: 120, isVerified: true),
        User(name: "Eren", username: "erenoz", followersCount: 173, isVerified: true),
        User(name: "Murathan", username: "aquilius", followersCount: 190, isVerified: false)
    ]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(users) { user in
                    HStack(spacing: 15.0) {
                        Circle()
                            .frame(width: 30, height: 30)
                        VStack(alignment: .leading) {
                            Text(user.name)
                                .font(.headline)
                            Text("@\(user.username)")
                                .font(.caption)
                                .foregroundStyle(.gray)
                        }
                        
                        Spacer()
                        
                        if user.isVerified {
                            Image(systemName: "checkmark.seal.fill")
                                .foregroundStyle(.blue)
                        }
                        
                        VStack {
                            Text("\(user.followersCount)")
                                .font(.headline)
                            Text("followers")
                                .font(.caption)
                                .foregroundStyle(.gray)
                        }
                    }
                }
            }
            .listStyle(InsetGroupedListStyle())
            .navigationTitle("Custom Model")
        }
    }
}

#Preview {
    CustomModelBootcamp()
}
