//
//  AccessibilityColors.swift
//  SwiftfullThinkingBootcamp
//
//  Created by Furkan Açıkgöz on 30.12.2024.
//

import SwiftUI

struct AccessibilityColors: View {
    
    @Environment(\.accessibilityReduceTransparency) var reduceTransparency
    @Environment(\.colorSchemeContrast) var colorSchemeContrast
    @Environment(\.accessibilityDifferentiateWithoutColor) var differentiateWithoutColor
    @Environment(\.accessibilityInvertColors) var invertColors
    
    var body: some View {
        VStack(spacing: 16) {
            Button("Button 1") {
                
            }
            .foregroundStyle(colorSchemeContrast == .increased ? .white : .primary)
            .buttonStyle(.borderedProminent)
            .tint(.blue)
            
            Button("Button 2") {
                
            }
            .foregroundStyle(.white)
            .buttonStyle(.borderedProminent)
            .tint(.orange)
            
            Button("Button 3") {
                
            }
            .foregroundStyle(.red)
            .buttonStyle(.borderedProminent)
            .tint(.purple)
            
            Button("Button 4") {
                
            }
            .foregroundStyle(differentiateWithoutColor ? .white : .green)
            .buttonStyle(.borderedProminent)
            .tint(.yellow)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            (reduceTransparency ? Color.black : Color.black.opacity(0.5))
                .ignoresSafeArea()
        )
        .font(.largeTitle)
    }
}

#Preview {
    AccessibilityColors()
}
