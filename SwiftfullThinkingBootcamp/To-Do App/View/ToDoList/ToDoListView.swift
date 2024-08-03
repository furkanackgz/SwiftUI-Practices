//
//  ToDoListView.swift
//  SwiftfullThinkingBootcamp
//
//  Created by Furkan Açıkgöz on 15.07.2024.
//

import SwiftUI

struct ToDoListView: View {
    
    @EnvironmentObject var listService: ListService
    
    var body: some View {
        ZStack {
            if listService.listItems.count > 0 {
                toDoList
                    .transition(.opacity.animation(.easeIn))
            } else {
                NoListDataView()
                    .transition(.opacity.animation(.easeIn))
            }
        }
        .navigationTitle("To-Do List 📝")
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                EditButton()
                    .font(.headline)
            }
            
            ToolbarItem(placement: .topBarTrailing) {
                NavigationLink {
                    ToDoAddView()
                } label: {
                    Text("Add")
                        .font(.headline)
                }
            }
        }
    }
}

// MARK: Components
private extension ToDoListView {
    var toDoList: some View {
        List {
            ForEach(listService.listItems) { listItem in
                ToDoListRowView(listItem: listItem)
                    .onTapGesture {
                        withAnimation(.linear) {
                            listService.updateIsCompleteState(of: listItem)
                        }
                    }
            }
            .onDelete(perform: listService.deleteItem)
            .onMove(perform: listService.moveItem)
        }
        .listStyle(.insetGrouped)
    }
}

#Preview {
    NavigationStack {
        ToDoListView()
    }
    .environmentObject(ListService())
}
