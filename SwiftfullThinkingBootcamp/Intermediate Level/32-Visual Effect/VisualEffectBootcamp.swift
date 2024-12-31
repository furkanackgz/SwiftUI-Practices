//
//  VisualEffectBootcamp.swift
//  SwiftfullThinkingBootcamp
//
//  Created by Furkan Açıkgöz on 31.12.2024.
//

import SwiftUI

struct VisualEffectBootcamp: View {
    
    @State private var text: String = "Hello world"
    
    var body: some View {
        VStack(spacing: 30) {
            Text(text)
                .font(.headline)
                .padding()
                .background(.red)
                .foregroundStyle(.white)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .visualEffect { content, geometry in
                    content
                        .grayscale(geometry.size.width > 300 ? 1 : 0)
                }
            
            Button("Append Hello world") {
                text.append(" Hello world")
            }
            .buttonStyle(.borderedProminent)
        }
    }
}

#Preview {
    VisualEffectBootcamp()
}
