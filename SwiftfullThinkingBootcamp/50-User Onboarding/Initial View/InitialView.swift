//
//  InitialView.swift
//  SwiftfullThinkingBootcamp
//
//  Created by Furkan Açıkgöz on 24.03.2024.
//

import SwiftUI

struct InitialView: View {
    
    @AppStorage("signed_in") var storedSignedIn: Bool = false
    
    var body: some View {
        ZStack {
            // background
            RadialGradient(colors: [Color.yellow, Color.indigo],
                           center: .topLeading,
                           startRadius: 5,
                           endRadius: 800)
            .ignoresSafeArea()
            
            // content
            if storedSignedIn {
                ProfileView()
                    .transition(.asymmetric(insertion: .move(edge: .top),
                                            removal: .move(edge: .bottom)))
            } else {
                OnboardingView()
                    .transition(.asymmetric(insertion: .move(edge: .top),
                                            removal: .move(edge: .bottom)))
            }
        }
    }
}

#Preview {
    InitialView()
}
