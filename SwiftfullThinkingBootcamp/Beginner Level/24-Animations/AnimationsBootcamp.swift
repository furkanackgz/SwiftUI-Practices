//
//  AnimationsBootcamp.swift
//  SwiftfullThinkingBootcamp
//
//  Created by Furkan Açıkgöz on 25.02.2024.
//

import SwiftUI

struct AnimationsBootcamp: View {
    
    @State var isAnimated = false
    
    var body: some View {
        VStack {
            Button("Press to animate") {
                isAnimated.toggle()
            }
            
            Spacer()
            
            RoundedRectangle(cornerRadius: isAnimated ? 25 : 50)
                .fill(isAnimated ? .red : .orange)
                .frame(
                    width: isAnimated ? 300 : 100,
                    height: isAnimated ? 300 : 100
                )
                .rotationEffect(
                    Angle(degrees: isAnimated ? 360 : 0)
                )
                .offset(y: isAnimated ? 150 : 0)
                .animation(
                    .spring(
                        duration: 0.5,
                        bounce: 0.5,
                        blendDuration: 0.1
                    ),
                    value: isAnimated
                )
            
            Spacer()
        }
    }
}

#Preview {
    AnimationsBootcamp()
}
