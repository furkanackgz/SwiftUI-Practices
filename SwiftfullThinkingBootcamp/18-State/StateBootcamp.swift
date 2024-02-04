//
//  StateBootcamp.swift
//  SwiftfullThinkingBootcamp
//
//  Created by Furkan Açıkgöz on 4.02.2024.
//

import SwiftUI

struct StateBootcamp: View {
    
    @State var backgroundColor: Color = .blue
    @State var title: String = "myTitle"
    @State var count: Int = 0
    
    var body: some View {
        ZStack {
            backgroundColor
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                Text(title)
                Text("count: \(count)")
                    .underline()
                
                HStack {
                    Button("Button 1") {
                        backgroundColor = .purple
                        title = "Button 1 was pressed"
                        count += 1
                    }
                    
                    Button("Button 2") {
                        backgroundColor = .brown
                        title = "Button 2 was pressed"
                        count -= 1
                    }
                }
            }
            .foregroundStyle(.white)
        }
    }
}

#Preview {
    StateBootcamp()
}
