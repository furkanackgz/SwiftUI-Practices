//
//  SystemIcons.swift
//  SwiftfullThinkingBootcamp
//
//  Created by Furkan Açıkgöz on 12.01.2024.
//

import SwiftUI

struct SystemIcons: View {
    var body: some View {
        Image(systemName: "xmark")
            .resizable()
//            .aspectRatio(contentMode: .fill)
//            .scaledToFit()?
//            .scaledToFill()
//            .font(.title)
//            .font(.system(size: 200))
            .foregroundStyle(.green)
            .frame(width: 100, height: 100)
//            .clipped()
    }
}

#Preview {
    SystemIcons()
}
