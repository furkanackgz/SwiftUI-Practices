//
//  ExtractingFunctionsAndSubviewsBootcamp.swift
//  SwiftfullThinkingBootcamp
//
//  Created by Furkan Açıkgöz on 4.02.2024.
//

import SwiftUI

struct ExtractingFunctionsAndSubviewsBootcamp: View {
    
    @State var backgroundColor: Color = .yellow
    @State var title: String = "myTitle"
    
    var body: some View {
        ZStack {
            backgroundColor
                .ignoresSafeArea()
            
            content
        }
    }
    
    var content: some View {
        VStack {
            Text(title)
                .font(.title)
            
            Button(action: {
                didPressButton()
            }, label: {
                Text("Press me")
                    .font(.headline)
                    .foregroundStyle(.white)
                    .padding()
                    .background(
                        Color.black
                            .clipShape(
                                RoundedRectangle(cornerRadius: 8)
                            )
                    )
            })
        }
    }
    
    func didPressButton() {
        backgroundColor = .pink
        title = "Button was pressed"
    }
}

#Preview {
    ExtractingFunctionsAndSubviewsBootcamp()
}
