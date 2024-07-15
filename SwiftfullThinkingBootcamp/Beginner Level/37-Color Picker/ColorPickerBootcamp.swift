//
//  ColorPickerBootcamp.swift
//  SwiftfullThinkingBootcamp
//
//  Created by Furkan Açıkgöz on 8.03.2024.
//

import SwiftUI

struct ColorPickerBootcamp: View {
    
    @State var backgroundColor: Color = .yellow
    
    var body: some View {
        ZStack {
            backgroundColor.ignoresSafeArea()
            
            ColorPicker(selection: $backgroundColor,
                        supportsOpacity: true) {
                Text("Pick color")
            }
            .foregroundStyle(.white)
            .font(.headline)
            .padding()
            .background(.black)
            .clipShape(RoundedRectangle(cornerRadius: 8))
            .padding(50)
        }
    }
}

#Preview {
    ColorPickerBootcamp()
}
