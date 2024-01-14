//
//  Gradients.swift
//  SwiftfullThinkingBootcamp
//
//  Created by Furkan Açıkgöz on 12.01.2024.
//

import SwiftUI

struct Gradients: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 5)
            .fill(
//                LinearGradient(
//                    gradient: Gradient(colors: [Color.red, Color.blue]),
//                    startPoint: .leading,
//                    endPoint: .trailing
//                )
                
//                RadialGradient(
//                    gradient: Gradient(colors: [Color.blue, Color.red]),
//                    center: .topLeading,
//                    startRadius: 1,
//                    endRadius: 200
//                )
                 
                AngularGradient(
                    gradient: Gradient(colors: [Color.red, Color.blue]),
                    center: .bottom,
                    angle: .degrees(90)
                )
            )
            .frame(width: 200,height:200)
            
    }
}

#Preview {
    Gradients()
}
