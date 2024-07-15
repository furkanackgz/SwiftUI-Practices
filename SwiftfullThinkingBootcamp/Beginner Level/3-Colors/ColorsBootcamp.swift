//
//  ColorsBootcamp.swift
//  SwiftfullThinkingBootcamp
//
//  Created by Furkan Açıkgöz on 7.01.2024.
//

import SwiftUI

struct ColorsBootcamp: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 25.0)
            .frame(width: 300, height: 150)
            .foregroundStyle(
//                Color.red
                Color(red: 0.1, green: 0.3, blue: 0.3)
            )
            .shadow(color: Color.red, radius: 10, x: 1, y: 1)
    }
}

#Preview {
    ColorsBootcamp()
}
