//
//  DragGestureBootcamp2.swift
//  SwiftfullThinkingBootcamp
//
//  Created by Furkan Açıkgöz on 8.09.2024.
//

import SwiftUI

struct DragGestureBootcamp2: View {
    
    @State private var initialOffset: CGFloat = 720
    @State private var yOffset: CGFloat = 0
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Color.green.ignoresSafeArea()
                
                SheetView()
                    .offset(y: initialOffset + yOffset)
                    .gesture(
                        DragGesture()
                            .onChanged { value in
                                guard initialOffset + yOffset >= 100 else { return }
                                withAnimation(.linear) {
                                    yOffset = value.translation.height
                                }
                            }
                            .onEnded { _ in
                                let halfHeightOfScreen = geometry.size.height / 2
                                let ratio = Int(yOffset / halfHeightOfScreen)
                                withAnimation(.spring) {
                                    yOffset = halfHeightOfScreen * CGFloat(ratio)
                                    initialOffset += yOffset
                                    yOffset = 0
                                }
                            }
                    )
            }
        }
    }
}

#Preview {
    DragGestureBootcamp2()
}

struct SheetView: View {
    var body: some View {
        VStack(spacing: 16) {
            Image(systemName: "chevron.up")
                .padding(.top)
            Text("Sign up")
            Image(systemName: "flame.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
            Text("This is the description for drag gesture bootcamp 2. For signign up button to shop up, user needs to pull sign up arrow button up to the top of screen")
                .multilineTextAlignment(.center)
            Button(action: {}) {
                Text("Create an Account")
                    .tint(.white)
                    .padding()
                    .background(
                        Color.black
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                    )
            }
            Spacer()
        }
        .ignoresSafeArea(edges: .bottom)
        .frame(maxWidth: .infinity)
        .background(
            Color.white
                .clipShape(RoundedRectangle(cornerRadius: 24))
        )
    }
}
