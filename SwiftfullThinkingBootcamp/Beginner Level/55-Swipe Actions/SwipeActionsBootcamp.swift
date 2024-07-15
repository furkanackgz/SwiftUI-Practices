//
//  SwipeActionsBootcamp.swift
//  SwiftfullThinkingBootcamp
//
//  Created by Furkan Açıkgöz on 17.06.2024.
//

import SwiftUI

struct SwipeActionsBootcamp: View {
    
    @State var fruits: [String] = [
        "Banana", "Apple", "Watermelon", "Lemon"
    ]
    
    var body: some View {
        List {
            ForEach(fruits, id: \.self) {
                Text($0)
                    .swipeActions(edge: .leading,
                                  allowsFullSwipe: true) {
                        Button("Save") {
                            
                        }
                        .tint(.yellow)
                    }
            }
            .onDelete(perform: { indexSet in
                
            })
        }
    }
}

#Preview {
    SwipeActionsBootcamp()
}
