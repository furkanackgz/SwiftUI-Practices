//
//  FocusStateBootcamp.swift
//  SwiftfullThinkingBootcamp
//
//  Created by Furkan Açıkgöz on 19.06.2024.
//

import SwiftUI

struct FocusStateBootcamp: View {
    
    enum OnboardingField: Hashable {
        case username
        case password
    }
    
    @State private var username: String = ""
    @State private var password: String = ""
    @FocusState private var focusOnField: OnboardingField?
    
    var body: some View {
        VStack(spacing: 30) {
            TextField("Enter username...", text: $username)
                .focused($focusOnField, equals: .username)
                .padding(.leading)
                .frame(height: 50)
                .frame(maxWidth: .infinity)
                .background(Color.gray.brightness(0.3))
                .clipShape(RoundedRectangle(cornerRadius: 8))
            
            SecureField("Enter password...", text: $password)
                .focused($focusOnField, equals: .password)
                .padding(.leading)
                .frame(height: 50)
                .frame(maxWidth: .infinity)
                .background(Color.gray.brightness(0.3))
                .clipShape(RoundedRectangle(cornerRadius: 8))
            
            Button("Sign Up") {
                let isUsernameValid = !username.isEmpty
                let isPasswordValid = !password.isEmpty
                
                if isUsernameValid && isPasswordValid {
                    print("Sign Up")
                } else if isUsernameValid {
                    focusOnField = .password
                } else {
                    focusOnField = .username
                }
            }
        }
        .padding(30)
    }
}

#Preview {
    FocusStateBootcamp()
}
