//
//  DragGestureBootcamp.swift
//  SwiftfullThinkingBootcamp
//
//  Created by Furkan Açıkgöz on 31.08.2024.
//

import SwiftUI

struct DragGestureBootcamp: View {
    
    @State private var offset: CGSize = .zero
    @State private var scaleAmount: CGFloat = 1
    @State private var rotationAmount: CGFloat = 0
    
    var body: some View {
        GeometryReader { geometry in
            RoundedRectangle(cornerRadius: 12)
                .frame(width: 300, height: 600)
                .offset(offset)
                .scaleEffect(scaleAmount)
                .rotation3DEffect(
                    .degrees(rotationAmount),
                    axis: (x: 0.0, y: 1.0, z: 0.0)
                )
                .gesture(
                    DragGesture()
                        .onChanged { value in
                            let ratio = value.translation.width / geometry.size.width
                            guard ratio >= -1/3 && ratio <= 1/3 else { return }
                            withAnimation(.linear) {
                                offset = value.translation
                                scaleAmount = calculateScaleAmount(with: value, and: geometry)
                                rotationAmount = calculateRotationAmount(with: value, and: geometry)
                            }
                        }
                        .onEnded { value in
                            withAnimation(.spring) {
                                offset = .zero
                                scaleAmount = 1
                                rotationAmount = 0
                            }
                        }
                )
                .position(CGPoint(x: geometry.size.width / 2,
                                  y: geometry.size.height / 2))
        }
    }
}

private extension DragGestureBootcamp {
    func calculateScaleAmount(with value: DragGesture.Value, and geometry: GeometryProxy) -> CGFloat {
        let screenWidth = geometry.size.width
        let transitonWidth = abs(value.translation.width)
        return (screenWidth - transitonWidth) / screenWidth
    }
    
    func calculateRotationAmount(with value: DragGesture.Value, and geometry: GeometryProxy) -> CGFloat {
        let screenWidth = geometry.size.width
        let transitonWidth = value.translation.width
        return -90 * transitonWidth / screenWidth
    }
}

#Preview {
    DragGestureBootcamp()
}
