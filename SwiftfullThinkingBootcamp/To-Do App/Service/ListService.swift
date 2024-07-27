//
//  ListService.swift
//  SwiftfullThinkingBootcamp
//
//  Created by Furkan Açıkgöz on 26.07.2024.
//

import Foundation

class ListService: ObservableObject {
    
    @Published var listItems: [ListItemModel] = []
    
    init() {
        getItems()
    }
    
    func getItems() {
        listItems = [
            .init(title: "This is the first item.", isCompleted: false),
            .init(title: "This is the second.", isCompleted: false),
            .init(title: "Third.", isCompleted: false)
        ]
    }
    
    func checkIfItemTileIsAppropriate(_ text: String) -> Bool {
        (text.count > 3) ? true : false
    }
    
    func createItemAndAddToList(title: String, isCompleted: Bool) {
        let itemModel = ListItemModel(title: title, isCompleted: isCompleted)
        listItems.append(itemModel)
    }
    
    func updateIsCompleteState(of listItem: ListItemModel) {
        if let selectedItemIndex = listItems.firstIndex(where: { $0.id == listItem.id }) {
            listItems[selectedItemIndex] = ListItemModel(id: listItem.id,
                                                         title: listItem.title,
                                                         isCompleted: !listItem.isCompleted)
        }
    }
    
    func deleteItemAt(_ indexSet: IndexSet) {
        listItems.remove(atOffsets: indexSet)
    }
    
    func moveItems(from fromOffsets: IndexSet, to toOffset: Int) {
        listItems.move(fromOffsets: fromOffsets, toOffset: toOffset)
    }
}
