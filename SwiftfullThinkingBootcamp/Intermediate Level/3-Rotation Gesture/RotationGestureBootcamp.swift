//
//  RotationGestureBootcamp.swift
//  SwiftfullThinkingBootcamp
//
//  Created by Furkan Açıkgöz on 31.08.2024.
//

import SwiftUI

struct RotationGestureBootcamp: View {
    
    @State private var rotationAngle: Angle = .zero
    
    var body: some View {
        Text("Hello, World!")
            .foregroundStyle(.white)
            .font(.headline)
            .fontWeight(.semibold)
            .padding(40)
            .background(.blue)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .rotationEffect(rotationAngle)
            .gesture(
                RotateGesture(minimumAngleDelta: .zero)
                    .onChanged { value in
                        rotationAngle = value.rotation
                    }
                    .onEnded { value in
                        withAnimation(.spring()) {
                            rotationAngle = .zero
                        }
                    }
            )
    }
}

#Preview {
    RotationGestureBootcamp()
}
