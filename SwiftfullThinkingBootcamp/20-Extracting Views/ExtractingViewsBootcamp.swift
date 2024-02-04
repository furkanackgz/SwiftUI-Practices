//
//  ExtractingViewsBootcamp.swift
//  SwiftfullThinkingBootcamp
//
//  Created by Furkan Açıkgöz on 4.02.2024.
//

import SwiftUI

struct ExtractingViewsBootcamp: View {
    var body: some View {
        ZStack {
            Color.mint
                .ignoresSafeArea()
            
         contentLayer
        }
    }
    
    var contentLayer: some View {
        HStack {
            MyItem(fruit: .apple)
            MyItem(fruit: .banana)
            MyItem(fruit: .grape)
        }
    }
}

#Preview {
    ExtractingViewsBootcamp()
}

struct MyItem: View {
    
    enum Fruit {
        case apple
        case banana
        case grape
    }
    
    private var backgroundColor: Color = .red
    private var name: String = ""
    private var count: Int = 0
    
    init(fruit: Fruit) {
        assignProperties(for: fruit)
    }
    
    var body: some View {
        contentLayer
    }
    
    private var contentLayer: some View {
        VStack {
            Text(name)
            
            Text("\(count)")
                .underline()
        }
        .foregroundStyle(.black)
        .padding()
        .background(
            backgroundColor
                .clipShape(
                    RoundedRectangle(cornerRadius: 8)
                )
        )
        .shadow(radius: 2)
    }
    
    mutating private func assignProperties(for fruit: Fruit) {
        switch fruit {
        case .apple:
            backgroundColor = .red
            name = "Apple"
            count = 1
        case .banana:
            backgroundColor = .yellow
            name = "Banana"
            count = 2
        case .grape:
            backgroundColor = .green
            name = "Grape"
            count = 3
        }
    }
}
