//
//  ToDoListView.swift
//  SwiftfullThinkingBootcamp
//
//  Created by Furkan Açıkgöz on 15.07.2024.
//

import SwiftUI

struct ToDoListView: View {
    
    @State var listItems: [ItemModel] = [
        .init(title: "This is the first item", isCompleted: false),
        .init(title: "This is the second item", isCompleted: true),
        .init(title: "This is the third item", isCompleted: false)
    ]
    
    var body: some View {
        List(listItems) { listItem in
            ToDoListRowView(listItem: listItem)
        }
        .listStyle(.insetGrouped)
        .navigationTitle("To-Do List 📝")
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                EditButton()
                    .font(.headline)
            }
            
            ToolbarItem(placement: .topBarTrailing) {
                NavigationLink(value: "Furkan") {
                    Text("Add")
                        .font(.headline)
                }
            }
        }
        .navigationDestination(for: String.self) { _ in
            ToDoAddView()
        }
    }
}


#Preview {
    NavigationStack {
        ToDoListView()
    }
}
