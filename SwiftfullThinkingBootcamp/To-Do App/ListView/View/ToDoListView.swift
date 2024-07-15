//
//  ToDoListView.swift
//  SwiftfullThinkingBootcamp
//
//  Created by Furkan Açıkgöz on 15.07.2024.
//

import SwiftUI

struct ToDoListView: View {
    
    @State var listItems: [String] = [
        "This is the first item",
        "This is the second item",
        "This is the third item"
    ]
    
    var body: some View {
        List(listItems, id: \.self) { listItem in
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
