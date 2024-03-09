//
//  StepperBootcamp.swift
//  SwiftfullThinkingBootcamp
//
//  Created by Furkan Açıkgöz on 9.03.2024.
//

import SwiftUI

struct StepperBootcamp: View {
    
    @State var widthIncrement: CGFloat = 0
    @State var stepperValue: Int = 0
    
    var body: some View {
        VStack(spacing: 50) {
            RoundedRectangle(cornerRadius: 25.0)
                .frame(width: 100 + widthIncrement,
                       height: 100)
                .foregroundStyle(.orange)
            
            Stepper("Stepper") {
                incrementWidth(by: 10)
            } onDecrement: {
                incrementWidth(by: -10)
            }
            
            
            VStack {
                HStack {
                    Text("Value:")
                    Text("\(stepperValue)")
                        .foregroundStyle(.orange)
                }
                .font(.headline)
                
                Stepper("Stepper 2", value: $stepperValue)
            }
        }
        .padding()
    }
    
    private func incrementWidth(by amount: CGFloat) {
        withAnimation(.spring) {
            widthIncrement += amount
        }
    }
}

#Preview {
    StepperBootcamp()
}
