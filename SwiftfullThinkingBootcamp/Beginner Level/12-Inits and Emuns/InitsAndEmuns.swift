//
//  InitsAndEmuns.swift
//  SwiftfullThinkingBootcamp
//
//  Created by Furkan Açıkgöz on 22.01.2024.
//

import SwiftUI

struct InitsAndEmuns: View {
    let count: Int
    let title: String
    let backgroundColor: Color
    
    init(count: Int, fruit: Fruit) {
        self.count = count
        
        switch fruit {
        case .apple:
            title = "Apples"
            backgroundColor = .red
        case .orange:
            title = "Oranges"
            backgroundColor = .orange
        }
    }
    
    enum Fruit {
        case apple
        case orange
    }
    
    var body: some View {
        VStack(spacing: 12) {
            Text("\(count)")
                .foregroundStyle(.white)
                .underline()
            
            Text(title)
                .foregroundStyle(.white)
                .font(.headline)
        }
        .frame(width: 100, height: 100)
        .background(backgroundColor)
        .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}

#Preview {
    HStack {
        InitsAndEmuns(count: 100, fruit: .apple)
        InitsAndEmuns(count: 90, fruit: .orange)
    }
}
