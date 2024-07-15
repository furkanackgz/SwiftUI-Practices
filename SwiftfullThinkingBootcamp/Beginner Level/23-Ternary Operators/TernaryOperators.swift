//
//  TernaryOperators.swift
//  SwiftfullThinkingBootcamp
//
//  Created by Furkan Açıkgöz on 25.02.2024.
//

import SwiftUI

struct TernaryOperators: View {
    
    @State var isStartingState = false
    
    var body: some View {
        VStack {
            Button("Press to change color") {
                isStartingState.toggle()
            }
            
            RoundedRectangle(cornerRadius: 25.0)
                .fill(isStartingState ? .blue : .red)
                .frame(width: 100, height: 100)
        }
    }
    
}

#Preview {
    TernaryOperators()
}
