//
//  ToDoListRowView.swift
//  SwiftfullThinkingBootcamp
//
//  Created by Furkan Açıkgöz on 16.07.2024.
//

import SwiftUI

struct ToDoListRowView: View {
    
    var listItem: ListItemModel
    
    var body: some View {
        HStack {
            Image(systemName: listItem.isCompleted ? "checkmark.circle" : "circle")
                .foregroundStyle(listItem.isCompleted ? .green : .gray)
            Text(listItem.title)
        }
        .font(.headline)
        .fontDesign(.serif)
        .listRowSeparatorTint(.orange, edges: .all)
    }
}

#Preview {
    ToDoListRowView(listItem: .init(title: "This is the first item",
                                    isCompleted: false))
}
