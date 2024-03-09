//
//  SliderBootcamp.swift
//  SwiftfullThinkingBootcamp
//
//  Created by Furkan Açıkgöz on 9.03.2024.
//

import SwiftUI

struct SliderBootcamp: View {
    
    @State var sliderValue = 4.0
    
    var body: some View {
        VStack {
            HStack {
                Text("Value: ")
                    .foregroundStyle(.gray)
                Text(String(format: "%.1f", sliderValue))
            }
            
            Slider(value: $sliderValue, in: 1...10, step: 1.0) {
                Text("Grade")
            } minimumValueLabel: {
                Text("1")
            } maximumValueLabel: {
                Text("10")
            }
            .tint(.orange)
        }
        .foregroundStyle(.orange)
        .font(.headline)
        .padding()
        
        
    }
}

#Preview {
    SliderBootcamp()
}
