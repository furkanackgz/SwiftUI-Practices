//
//  BadgesBootcamp.swift
//  SwiftfullThinkingBootcamp
//
//  Created by Furkan Açıkgöz on 17.06.2024.
//

import SwiftUI

struct BadgesBootcamp: View {
    var body: some View {
        
        List {
            Text("Hello World")
                .badge(4)
            Text("Hello World")
            Text("Hello World")
            Text("Hello World")
            Text("Hello World")
        }
        
//        TabView {
//            Color.red
//                .tabItem {
//                    Label {
//                       Text("Red")
//                           .font(.system(size: 35))
//                   } icon: {
//                       Image(systemName: "heart.fill")
//                   }
//                }
//                .badge("New")
//                
//            Color.yellow
//                .tabItem {
//                    Label(
//                        title: { Text("Yellow") },
//                        icon: { Image(systemName: "heart.fill") }
//                    )
//                }
//            
//            Color.blue
//                .tabItem {
//                    Label(
//                        title: { Text("Blue") },
//                        icon: { Image(systemName: "heart.fill") }
//                    )
//                }
//        }
        
    }
}

#Preview {
    BadgesBootcamp()
}
