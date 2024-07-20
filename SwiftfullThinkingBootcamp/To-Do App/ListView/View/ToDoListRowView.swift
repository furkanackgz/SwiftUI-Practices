//
//  ToDoListRowView.swift
//  SwiftfullThinkingBootcamp
//
//  Created by Furkan Açıkgöz on 16.07.2024.
//

import SwiftUI

struct ToDoListRowView: View {
    
    @State var listItem: ItemModel
    
    var body: some View {
        Label(listItem.title,
              systemImage: listItem.isCompleted ? "checkmark.circle" : "circle")
        .listItemTint(listItem.isCompleted ? .green : .gray)
        .font(.headline)
        .fontDesign(.serif)
        .listRowSeparatorTint(.orange, edges: .all)
    }
}

#Preview {
    ToDoListRowView(listItem: .init(title: "This is the first item",
                                    isCompleted: false))
}
