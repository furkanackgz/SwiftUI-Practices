//
//  ListService.swift
//  SwiftfullThinkingBootcamp
//
//  Created by Furkan Açıkgöz on 26.07.2024.
//

import Foundation

class ListService: ObservableObject {
    
    @Published var listItems: [ListItemModel] = [] {
        didSet {
            saveListItems()
        }
    }
    private var listItemsKey: String = "listItems"
    
    init() {
        getListItems()
    }
    
    func getListItems() {
        guard 
            let encodedListItems = UserDefaults.standard.data(forKey: listItemsKey),
            let decodedListItems = try? JSONDecoder().decode([ListItemModel].self, from: encodedListItems)
        else { return }
        listItems = decodedListItems
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
    
    func deleteItem(at indexSet: IndexSet) {
        listItems.remove(atOffsets: indexSet)
    }
    
    func moveItem(from fromOffsets: IndexSet, to toOffset: Int) {
        listItems.move(fromOffsets: fromOffsets, toOffset: toOffset)
    }
}

private extension ListService {
    func saveListItems() {
        if let encodedListItems = try? JSONEncoder().encode(listItems) {
            UserDefaults.standard.setValue(encodedListItems, forKey: listItemsKey)
        }
    }
}
