//
//  ButtonStylesBootcamp.swift
//  SwiftfullThinkingBootcamp
//
//  Created by Furkan Açıkgöz on 17.06.2024.
//

import SwiftUI

struct ButtonStylesBootcamp: View {
    var body: some View {
        VStack {
            Button {
                
            } label: {
                Text("Button Label")
                    .frame(height: 50)
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(.borderedProminent)
            .buttonBorderShape(.capsule)
            .controlSize(.regular)
            
            Button {
                
            } label: {
                Text("Button Label 2")
                    .frame(height: 50)
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(.borderedProminent)
            .buttonBorderShape(.roundedRectangle(radius: 20))
            .controlSize(.regular)
        }
        .padding()
    }
}

#Preview {
    ButtonStylesBootcamp()
}
