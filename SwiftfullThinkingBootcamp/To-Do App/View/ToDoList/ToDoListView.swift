//
//  ToDoListView.swift
//  SwiftfullThinkingBootcamp
//
//  Created by Furkan Açıkgöz on 15.07.2024.
//

import SwiftUI

struct ToDoListView: View {
    
    @StateObject private var listService: ListService = ListService()
    
    var body: some View {
        List {
            ForEach(listService.listItems) { listItem in
                ToDoListRowView(listItem: listItem)
                    .onTapGesture {
                        listService.updateIsCompleteState(of: listItem)
                    }
            }
            .onDelete(perform: listService.deleteItem)
            .onMove(perform: listService.moveItem)
        }
        .listStyle(.insetGrouped)
        .navigationTitle("To-Do List 📝")
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                EditButton()
                    .font(.headline)
            }
            
            ToolbarItem(placement: .topBarTrailing) {
                NavigationLink {
                    ToDoAddView(listService: listService)
                } label: {
                    Text("Add")
                        .font(.headline)
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        ToDoListView()
    }
}
