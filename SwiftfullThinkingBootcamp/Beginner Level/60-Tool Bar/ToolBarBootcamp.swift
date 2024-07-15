//
//  ToolBarBootcamp.swift
//  SwiftfullThinkingBootcamp
//
//  Created by Furkan Açıkgöz on 19.06.2024.
//

import SwiftUI

struct ToolBarBootcamp: View {
    
    @State private var navigationPath = [String]()
    
    var body: some View {
        NavigationStack(path: $navigationPath) {
            ZStack {
                Color.indigo.ignoresSafeArea()
                
                Text("Hey There!")
            }
            .navigationTitle("Tool Bar")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: {
                        navigationPath.append("Heart")
                    }, label: {
                        Image(systemName: "heart.fill")
                            .foregroundStyle(.white)
                    })
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        navigationPath.append("Gear")
                    }, label: {
                        Image(systemName: "gear")
                            .foregroundStyle(.white)
                    })
                }
            }
            .toolbarTitleDisplayMode(.inline)
            .toolbarTitleMenu {
                Button("Screen 1") {
                    navigationPath.append("Screen 1")
                }
                
                Button("Screen 2") {
                    navigationPath.append("Screen 2")
                }
            }
//            .toolbar(.hidden, for: .navigationBar)
//            .toolbarBackground(.hidden, for: .navigationBar)
//            .toolbarColorScheme(.dark, for: .navigationBar)
            .navigationDestination(for: String.self) { value in
                Text("\(value)")
            }
        }
    }
}

#Preview {
    ToolBarBootcamp()
}
