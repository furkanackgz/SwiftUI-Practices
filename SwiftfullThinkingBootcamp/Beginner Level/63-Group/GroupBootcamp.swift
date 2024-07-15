//
//  GroupBootcamp.swift
//  SwiftfullThinkingBootcamp
//
//  Created by Furkan Açıkgöz on 20.06.2024.
//

import SwiftUI

struct GroupBootcamp: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Hello, World!")
            
            Group {
                Text("Hello, World!")
                Text("Hello, World!")
            }
            .foregroundStyle(.green)
            .font(.headline)
        }
        .foregroundStyle(.red)
        .font(.title2)
    }
}

#Preview {
    GroupBootcamp()
}
