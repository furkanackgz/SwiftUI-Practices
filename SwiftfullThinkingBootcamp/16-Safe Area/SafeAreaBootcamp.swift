//
//  SafeAreaBootcamp.swift
//  SwiftfullThinkingBootcamp
//
//  Created by Furkan Açıkgöz on 28.01.2024.
//

import SwiftUI

struct SafeAreaBootcamp: View {
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 0) {
                Text("This is the title")
                    .font(.title)
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                
                ForEach(0..<20) { _ in
                    RoundedRectangle(cornerRadius: 25.0)
                        .fill(.white)
                        .frame(height: 150)
                        .shadow(radius: 10)
                        .padding()
                }
            }
        }
        .background(
            Color.blue
                .ignoresSafeArea()
        )
        .scrollIndicators(.hidden)
    }
}

#Preview {
    SafeAreaBootcamp()
}
