//
//  TransitionsBootcamp.swift
//  SwiftfullThinkingBootcamp
//
//  Created by Furkan Açıkgöz on 25.02.2024.
//

import SwiftUI

struct TransitionsBootcamp: View {
    @State var isTransitioned: Bool = false
    
    var body: some View {
        ZStack(alignment: .bottom) {
            VStack {
                Button("Press me") {
                    withAnimation(.easeInOut) {
                        isTransitioned.toggle()
                    }
                }
                
                Spacer()
            }
            
            if isTransitioned {
                RoundedRectangle(cornerRadius: 25.0)
                    .fill(.orange)
                    .frame(height: 300)
                    .transition(.move(edge: .bottom))
            }
        }
        .ignoresSafeArea(edges: .bottom)
    }
}

#Preview {
    TransitionsBootcamp()
}
