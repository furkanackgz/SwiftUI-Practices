//
//  Padding.swift
//  SwiftfullThinkingBootcamp
//
//  Created by Furkan Açıkgöz on 14.01.2024.
//

import SwiftUI

struct Padding: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Hello, World!")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .padding(.bottom, 20)
            
            Text("This is the description of what we will do on this screen. It is multiple lines and we will align the text to the leading edge.")
        }
        .padding()
        .background(
            Color.white
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .shadow(color: .black.opacity(0.3),
                        radius: 10,
                        x: 0,
                        y: 10)
        )
        .padding(.horizontal, 10)
        
    }
}

#Preview {
    Padding()
}
