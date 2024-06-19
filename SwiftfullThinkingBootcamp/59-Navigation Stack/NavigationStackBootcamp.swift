//
//  NavigationStackBootcamp.swift
//  SwiftfullThinkingBootcamp
//
//  Created by Furkan Açıkgöz on 19.06.2024.
//

import SwiftUI

struct NavigationStackBootcamp: View {
    
//    @State private var navigationPath = [Int]()
//    @State private var navigationPath = [11, 12]
    
    var body: some View {
//        NavigationStack(path: $navigationPath) {
        NavigationStack {
            ScrollView {
                VStack(spacing: 30) {
//                    Button("Super segue") {
//                        navigationPath.append(contentsOf: [13, 14])
//                    }
                    
                    NavigationLink(value: "Banana") {
                        Text("Banana")
                    }
                    
                    ForEach(0..<10) { num in
                        NavigationLink(value: num) {
                            Text("Page: \(num)")
                        }
                    }
                }
            }
            .padding()
            .navigationTitle("Nav Title")
            .navigationDestination(for: Int.self) { num in
                Text("Page inside of: \(num)")
            }
            .navigationDestination(for: String.self) { str in
                Text("Page inside of: \(str)")
            }
        }
    }
}

#Preview {
    NavigationStackBootcamp()
}
