//
//  Stacks.swift
//  SwiftfullThinkingBootcamp
//
//  Created by Furkan Açıkgöz on 14.01.2024.
//

import SwiftUI

struct Stacks: View {
    var body: some View {
        VStack {
            Rectangle()
                .fill(Color.red)
                .frame(width: 100, height: 100)
                .overlay(
                    Text("1")
                        .font(.largeTitle)
                        .foregroundStyle(.white)
                )
                .shadow(color: .red.opacity(0.5),
                        radius: 10)
            
            Rectangle()
                .fill(Color.orange)
                .frame(width: 100, height: 100)
                .overlay(
                    Text("2")
                        .font(.largeTitle)
                        .foregroundStyle(.white)
                )
                .shadow(color: .orange.opacity(0.5),
                        radius: 10)
            
            HStack {
                Rectangle()
                    .fill(Color.yellow)
                    .frame(width: 100, height: 100)
                    .overlay(
                        Text("3")
                            .font(.largeTitle)
                            .foregroundStyle(.white)
                    )
                    .shadow(color: .yellow.opacity(0.5),
                            radius: 10)
                
                Rectangle()
                    .fill(Color.green)
                    .frame(width: 100, height: 100)
                    .overlay(
                        Text("4")
                            .font(.largeTitle)
                            .foregroundStyle(.white)
                    )
                    .shadow(color: .green.opacity(0.5),
                            radius: 10)
                
                Rectangle()
                    .fill(Color.indigo)
                    .frame(width: 100, height: 100)
                    .overlay(
                        Text("5")
                            .font(.largeTitle)
                            .foregroundStyle(.white)
                    )
                    .shadow(color: .indigo.opacity(0.5),
                            radius: 10)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            Color.blue
        )
    }
}

#Preview {
    Stacks()
}
