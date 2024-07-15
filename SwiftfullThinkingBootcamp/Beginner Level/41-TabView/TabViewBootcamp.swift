//
//  TabViewBootcamp.swift
//  SwiftfullThinkingBootcamp
//
//  Created by Furkan Açıkgöz on 9.03.2024.
//

import SwiftUI

struct TabViewBootcamp: View {
    
    @State var selection: Int = 0
    private var pageTitles: [String] = [
        "First Page", "Second Page", "Third Page"
    ]
    
    var body: some View {
        
        // Page View
        TabView(selection: $selection) {
            ForEach(pageTitles.indices, id: \.self) { index in
                TabViews(backgroundColor: .orange,
                         pageTitle: pageTitles[index])
                .padding()
                .tag(index)
            }
        }
        .tabViewStyle(PageTabViewStyle())
        .frame(height: 300)
        
        // Tab View
//        TabView(selection: $selection) {
//            TabViewWithButton(selection: $selection,
//                              backgroundColor: .orange,
//                              pageTitle: "First Page")
//            .tabItem {
//                Image(systemName: "flame.fill")
//                Text("First Page")
//                    .font(.headline)
//            }
//            .tag(0)
//            
//            TabViews(backgroundColor: .green,
//                     pageTitle: "Second Page")
//            .tabItem {
//                Image(systemName: "heart.fill")
//                Text("Second Page")
//                    .font(.headline)
//            }
//            .tag(1)
//            
//            TabViews(backgroundColor: .purple,
//                     pageTitle: "Third Page")
//            .tabItem {
//                Image(systemName: "person.fill")
//                Text("Third Page")
//                    .font(.headline)
//            }
//            .tag(2)
//        }
//        .tint(.white)
//        .foregroundStyle(.white)
    }
}

struct TabViews: View {
    
    @State var backgroundColor: Color
    @State var pageTitle: String
    
    var body: some View {
        ZStack {
            backgroundColor.ignoresSafeArea()
            
            Text(pageTitle)
        }
    }
}

struct TabViewWithButton: View {
    
    @Binding var selection: Int
    @State var backgroundColor: Color
    @State var pageTitle: String
    
    var body: some View {
        ZStack {
            backgroundColor.ignoresSafeArea()
            
            VStack(spacing: 30) {
                Text(pageTitle)
                
                Button(action: {
                    selection = 2
                }, label: {
                    Text("Go to 3rd tab")
                        .padding()
                        .foregroundStyle(.black)
                        .font(.subheadline)
                        .background(
                            Color.white
                                .clipShape(
                                    RoundedRectangle(cornerRadius: 12)
                                )
                        )
                })
            }
        }
    }
}

#Preview {
    TabViewBootcamp()
}
