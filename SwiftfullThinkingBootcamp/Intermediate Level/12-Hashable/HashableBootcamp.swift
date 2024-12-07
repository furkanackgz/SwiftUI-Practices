//
//  HashableBootcamp.swift
//  SwiftfullThinkingBootcamp
//
//  Created by Furkan Açıkgöz on 7.12.2024.
//

import SwiftUI

struct MyHashableModel: Hashable {
    let title: String
    let subtitle: String
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(title + subtitle)
    }
}

struct HashableBootcamp: View {
    
    let data: [MyHashableModel] = [
        .init(title: "One", subtitle: "one"),
        .init(title: "Two", subtitle: "two"),
        .init(title: "Three", subtitle: "three"),
        .init(title: "Four", subtitle: "four")
    ]
    
    var body: some View {
        ScrollView {
            VStack(spacing: 40) {
                ForEach(data, id: \.self) { item in
                    Text(item.title)
                        .font(.title)
                }
            }
        }
    }
}

#Preview {
    HashableBootcamp()
}
