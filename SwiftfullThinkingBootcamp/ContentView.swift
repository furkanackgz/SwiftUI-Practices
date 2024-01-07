//
//  ContentView.swift
//  SwiftfullThinkingBootcamp
//
//  Created by Furkan Açıkgöz on 7.01.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Hello, World! This is Furkan, an iOS Developer from Arcelik Global!")
//                .font(.title)
//                .fontWeight(.semibold)
                .foregroundStyle(Color.green)
//                .underline(true, color: .mint)
//                .strikethrough(true, color: .orange)
//                .italic()
//                .padding()
                .kerning(2.0)
                .baselineOffset(20)
                .multilineTextAlignment(.leading)
                .font(.system(size: 21,
                              weight: .medium,
                              design: .serif)
                )
//                .frame(width: 100, height: 100, alignment: .trailing)
                .minimumScaleFactor(0.3)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
