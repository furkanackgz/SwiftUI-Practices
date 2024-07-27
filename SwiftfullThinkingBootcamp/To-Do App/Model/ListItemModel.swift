//
//  ListItemModel.swift
//  SwiftfullThinkingBootcamp
//
//  Created by Furkan Açıkgöz on 20.07.2024.
//

import Foundation

struct ListItemModel: Identifiable {
    let id: String
    let title: String
    let isCompleted: Bool
    
    init(id: String = UUID().uuidString, title: String, isCompleted: Bool) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
    }
}
