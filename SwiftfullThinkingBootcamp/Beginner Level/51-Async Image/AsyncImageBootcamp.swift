//
//  AsyncImageBootcamp.swift
//  SwiftfullThinkingBootcamp
//
//  Created by Furkan Açıkgöz on 15.06.2024.
//

import SwiftUI

struct AsyncImageBootcamp: View {
    
    private let url = URL(string: "https://picsum.photos/400")
    
    var body: some View {
        AsyncImage(url: url) { returnedImage in
            returnedImage
                .resizable()
                .scaledToFit()
                .frame(width: 300, height: 300)
                .clipShape(
                    RoundedRectangle(cornerRadius: 8)
                )
                .shadow(radius: 10)
        } placeholder: {
            ProgressView()
        }
    }
}

#Preview {
    AsyncImageBootcamp()
}
