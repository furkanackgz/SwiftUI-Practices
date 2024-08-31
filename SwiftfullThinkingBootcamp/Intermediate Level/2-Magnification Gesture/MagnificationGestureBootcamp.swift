//
//  MagnificationGestureBootcamp.swift
//  SwiftfullThinkingBootcamp
//
//  Created by Furkan Açıkgöz on 31.08.2024.
//

import SwiftUI

struct MagnificationGestureBootcamp: View {
    
    @State private var magnification: CGFloat = 1
    
    var body: some View {
        VStack(spacing: 10) {
            HStack {
                Circle()
                    .frame(width: 35, height: 35)
                Text("Furkan Açıkgöz")
                Spacer()
                Image(systemName: "ellipsis")
            }
            .padding(.horizontal)
            
            Rectangle()
                .aspectRatio(1, contentMode: .fit)
                .scaleEffect(magnification)
                .gesture(
                    MagnifyGesture(minimumScaleDelta: 1)
                        .onChanged { value in
                            magnification = value.magnification
                        }
                        .onEnded { value in
                            withAnimation(.spring) {
                                magnification = 1
                            }
                        }
                )
            
            HStack {
                Image(systemName: "heart.fill")
                Image(systemName: "text.bubble.fill")
                Spacer()
            }
            .font(.headline)
            .padding(.horizontal)
            
            Text("This is the caption for the post.")
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
        }
    }
}

/*
 
 First example
 
 Text("Hello, World!")
     .padding(40)
     .background(.red)
     .clipShape(RoundedRectangle(cornerRadius: 8))
     .foregroundStyle(.white)
     .font(.headline)
     .scaleEffect(magnification)
     .gesture(
         MagnifyGesture(minimumScaleDelta: 1)
             .onChanged { value in
                 magnification = value.magnification
             }
             .onEnded { value in
                 withAnimation(.spring) {
                     magnification = 1
                 }
             }
     )
 
 */

#Preview {
    MagnificationGestureBootcamp()
}
