//
//  ToDoListRowView.swift
//  SwiftfullThinkingBootcamp
//
//  Created by Furkan Açıkgöz on 16.07.2024.
//

import SwiftUI

struct ToDoListRowView: View {
    
    @State var listItem: String
    
    var body: some View {
        Label(listItem, systemImage: "checkmark.circle")
            .listItemTint(.green)
            .font(.headline)
            .fontDesign(.serif)
            .listRowSeparatorTint(.orange, edges: .all)
    }
}

#Preview {
    ToDoListRowView(listItem: "This is the first item.")
}
