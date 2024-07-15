//
//  ProfileView.swift
//  SwiftfullThinkingBootcamp
//
//  Created by Furkan Açıkgöz on 30.03.2024.
//

import SwiftUI

struct ProfileView: View {
    
    @AppStorage("name") var storedName: String?
    @AppStorage("age") var storedAge: Int?
    @AppStorage("gender") var storedGender: String?
    @AppStorage("signed_in") var storedSignedIn: Bool = false
    
    var body: some View {
        VStack(spacing: 12) {
            Image(systemName: "person.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 150)
                .foregroundStyle(.indigo)
            Text("Name: \(storedName ?? "Your name here...")")
            Text("Age: \(storedAge ?? 0)")
            Text("Gender: \(storedGender ?? "Not specified...")")
            Button {
                signOut()
            } label: {
                Text("Sign Out")
                    .foregroundStyle(.yellow)
                    .padding()
                    .padding(.horizontal, 40)
                    .background(
                        Color.indigo
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                    )
            }
        }
        .font(.title3)
        .fontWeight(.medium)
        .padding(40)
        .background(
            Color.yellow
                .clipShape(RoundedRectangle(cornerRadius: 18))
        )
        .shadow(radius: 10)
    }
}

// MARK: FUNCTIONS
private extension ProfileView {
    func signOut() {
        storedName = nil
        storedAge = nil
        storedGender = nil
        withAnimation(.spring) {
            storedSignedIn = false
        }
    }
}

#Preview {
    ProfileView()
}
