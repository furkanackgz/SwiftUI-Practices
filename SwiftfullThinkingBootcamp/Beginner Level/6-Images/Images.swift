//
//  Images.swift
//  SwiftfullThinkingBootcamp
//
//  Created by Furkan Açıkgöz on 12.01.2024.
//

import SwiftUI

struct Images: View {
    var body: some View {
        Image("google")
//            .resizable()
//            .renderingMode(.template)
//            .foregroundColor(.blue)
//            .aspectRatio(contentMode: .fill)
//            .scaledToFit()
//            .scaledToFill()
            .frame(width: 200, height: 200)
            .clipShape(
                Circle()
//                Ellipse()
            )
        
    }
}

#Preview {
    Images()
}
