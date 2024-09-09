//
//  ScrollViewReaderBootcamp.swift
//  SwiftfullThinkingBootcamp
//
//  Created by Furkan Açıkgöz on 9.09.2024.
//

import SwiftUI

struct ScrollViewReaderBootcamp: View {
    
    @State private var textFieldText: String = ""
    @State private var scrollToIndex: Int = 0
    
    var body: some View {
        VStack(spacing: 12) {
            TextField("Enter number of view to scroll to..", text: $textFieldText)
                .padding()
                .border(.gray)
                .padding(.horizontal)
                .keyboardType(.numberPad)
            
            Button("Scroll To Entered Number") {
                if let index = Int(textFieldText) {
                    scrollToIndex = index
                }
            }
            .tint(.blue)
            
            ScrollView {
                ScrollViewReader { proxy in
                    ForEach(0..<50) { index in
                        Text("View \(index)")
                            .frame(maxWidth: .infinity)
                            .frame(height: 150)
                            .background(.white)
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                            .padding()
                            .shadow(radius: 12)
                            .id(index)
                    }
                    .onChange(of: scrollToIndex) {
                        withAnimation(.spring) {
                            proxy.scrollTo(scrollToIndex, anchor: .center)
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    ScrollViewReaderBootcamp()
}
