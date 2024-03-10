//
//  TapGestureBootcamp.swift
//  SwiftfullThinkingBootcamp
//
//  Created by Furkan Açıkgöz on 10.03.2024.
//

import SwiftUI

struct TapGestureBootcamp: View {
    
    @State var isTapped: Bool = false
    
    var body: some View {
        VStack(spacing: 20) {
            
            RoundedRectangle(cornerRadius: 25.0)
                .frame(height: 200)
                .foregroundStyle(isTapped ? Color.green : Color.red)
            
            Button(action: {
                isTapped.toggle()
            }, label: {
                Text("Button")
                    .foregroundStyle(.white)
                    .font(.headline)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical)
                    .background(.blue)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
            })
            
            Text("Tap Gesture")
                .foregroundStyle(.white)
                .font(.headline)
                .frame(maxWidth: .infinity)
                .padding(.vertical)
                .background(.blue)
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .onTapGesture(count: 1) {
                    isTapped.toggle()
                }
            
        }
        .padding(40)
    }
}

#Preview {
    TapGestureBootcamp()
}
