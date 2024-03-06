//
//  ContextMenuBootcamp.swift
//  SwiftfullThinkingBootcamp
//
//  Created by Furkan Açıkgöz on 6.03.2024.
//

import SwiftUI

struct ContextMenuBootcamp: View {
    
    @State var backgroundColor: Color = .green
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10.0) {
            Image(systemName: "house.fill")
                .font(.title)
            Text("Swiftfull Thinking")
                .font(.headline)
            Text("How to use context menu")
                .font(.subheadline)
        }
        .padding()
        .background(
            backgroundColor
                .clipShape(
                    RoundedRectangle(cornerRadius: 25.0)
                )
        )
        .contextMenu {
            Button(action: {
                backgroundColor = .blue
            }, label: {
                Label("Share", systemImage: "flame.fill")
            })
            
            Button(role: .destructive) {
                backgroundColor = .red
            } label: {
                Label("Delete", systemImage: "xmark")
            }
            
            Button(action: {
                backgroundColor = .orange
            }, label: {
                Label("Report", systemImage: "circle.fill")
            })
        } preview: {
            Image(systemName: "flame.fill")
                .font(.title)
        }

    }
}

#Preview {
    ContextMenuBootcamp()
}
