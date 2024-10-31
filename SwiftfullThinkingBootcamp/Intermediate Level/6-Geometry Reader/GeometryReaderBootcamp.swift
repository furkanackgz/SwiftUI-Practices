//
//  GeometryReaderBootcamp.swift
//  SwiftfullThinkingBootcamp
//
//  Created by Furkan Açıkgöz on 31.10.2024.
//

import SwiftUI

struct GeometryReaderBootcamp: View {
    var body: some View {
        GeometryReader { proxy in
            HStack(spacing: 0) {
                Rectangle()
                    .fill(.red)
                    .frame(width: proxy.size.width * 2/3)
                Rectangle()
                    .fill(.blue)
            }
            .ignoresSafeArea()
        }
    }
}

#Preview {
    GeometryReaderBootcamp()
}
