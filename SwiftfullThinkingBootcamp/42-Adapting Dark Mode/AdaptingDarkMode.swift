//
//  AdaptingDarkMode.swift
//  SwiftfullThinkingBootcamp
//
//  Created by Furkan Açıkgöz on 10.03.2024.
//

import SwiftUI

struct AdaptingDarkMode: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    Text("Primary Color")
                        .foregroundStyle(.primary)
                    Text("Secondary COlor")
                        .foregroundStyle(.secondary)
                    Text("Black Color")
                        .foregroundStyle(.black)
                    Text("White Color")
                        .foregroundStyle(.white)
                    Text("Red Color")
                        .foregroundStyle(.red)
                    Text("Globally Adaptive Color")
                        .foregroundStyle(.adaptive)
                    Text("Locally Adaptive Color")
                        .foregroundStyle(colorScheme == .light ? .purple : .green)
                }
                .padding(100)
            }
        }
    }
}

#Preview {
    AdaptingDarkMode()
}
