//
//  SafeAreaInsets.swift
//  SwiftfullThinkingBootcamp
//
//  Created by Furkan Açıkgöz on 20.06.2024.
//

import SwiftUI

struct SafeAreaInsets: View {
    var body: some View {
        NavigationStack {
            List(0..<10) { _ in
                Rectangle()
                    .frame(height: 300)
            }
            .navigationTitle("Safe Area")
        }
        .safeAreaInset(edge: .bottom, alignment: .trailing) {
            Image(systemName: "heart.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 50)
                .foregroundStyle(.yellow)
                .padding()
        }
    }
}

#Preview {
    SafeAreaInsets()
}
