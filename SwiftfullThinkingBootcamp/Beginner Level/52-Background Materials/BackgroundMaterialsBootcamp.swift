//
//  BackgroundMaterialsBootcamp.swift
//  SwiftfullThinkingBootcamp
//
//  Created by Furkan Açıkgöz on 15.06.2024.
//

import SwiftUI

struct BackgroundMaterialsBootcamp: View {
    var body: some View {
        VStack {
            Spacer()
            
            VStack {
                RoundedRectangle(cornerRadius: 8)
                    .frame(width: 50, height: 4)
                    .background(.red)
                    .padding()
                
                Spacer()
            }
            .frame(height: 200)
            .frame(maxWidth: .infinity)
            .background(.ultraThinMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 35.0))
        }
        .ignoresSafeArea()
        .background(.orange)
    }
}

#Preview {
    BackgroundMaterialsBootcamp()
}
