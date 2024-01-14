//
//  BackgroundAndOverlay.swift
//  SwiftfullThinkingBootcamp
//
//  Created by Furkan Açıkgöz on 13.01.2024.
//

import SwiftUI

struct BackgroundAndOverlay: View {
    var body: some View {
        Image(systemName: "heart.fill")
            .font(.system(size: 40))
            .foregroundColor(.white)
            .background(
                Circle()
                    .fill(
                        LinearGradient(
                            gradient: Gradient(
                                colors: [
                                    Color(red: 1, green: 1, blue: 0),
                                    Color(red: 1, green: 122/255, blue: 0)
                                ]
                            ),
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    )
                    .frame(width: 100, height: 100)
                    .overlay(
                        Circle()
                            .fill(.blue)
                            .frame(width: 35, height: 35)
                            .overlay(
                                Text("1")
                                    .foregroundColor(.white)
                                    .bold()
                            )
                            .shadow(
                                color: Color(red: 1, green: 122/255, blue: 0).opacity(0.3),
                                radius: 5,
                                x: 5,
                                y: 5
                            )
                        , alignment: .bottomTrailing
                    )
                    .shadow(
                        color: Color(red: 1, green: 122/255, blue: 0).opacity(0.7),
                        radius: 5
                    )
            )
    }
}

#Preview {
    BackgroundAndOverlay()
}
