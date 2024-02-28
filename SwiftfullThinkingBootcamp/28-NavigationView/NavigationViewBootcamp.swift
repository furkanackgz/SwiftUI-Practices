//
//  NavigationViewBootcamp.swift
//  SwiftfullThinkingBootcamp
//
//  Created by Furkan Açıkgöz on 28.02.2024.
//

import SwiftUI

struct NavigationViewBootcamp: View {
    var body: some View {
        NavigationView {
            ScrollView {
                Spacer()
                Image(systemName: "gear")
                    .font(.largeTitle)
                Spacer()
                Text("Gear")
                Spacer()
            }
            .navigationTitle("Main Page")
            .toolbar {
                ToolbarItemGroup(placement: .topBarLeading) {
                    NavigationLink {
                        NavigationViewSecondScreen()
                    } label: {
                        Image(systemName: "person.fill")
                    }
                    .tint(.orange)
                }
                
                ToolbarItemGroup(placement: .topBarTrailing) {
                    Button(action: {
                        print("")
                    }, label: {
                        Text("System")
                            .foregroundStyle(.orange)
                    })
                }
            }
        }
    }
}

struct NavigationViewSecondScreen: View {
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            Color.orange.ignoresSafeArea()
                .toolbar(.hidden, for: .navigationBar)
            
            VStack {
                Spacer()
                
                Button(action: {
                    dismiss()
                }, label: {
                    Text("Back")
                })
                
                Spacer()
                
                NavigationLink {
                    Text("New Page")
                } label: {
                    Image(systemName: "star")
                        .font(.largeTitle)
                }
                
                Spacer()
            }
        }
    }
}

#Preview {
    NavigationViewBootcamp()
}
