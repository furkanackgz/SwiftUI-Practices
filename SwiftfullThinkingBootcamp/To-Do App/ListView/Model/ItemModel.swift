//
//  ItemModel.swift
//  SwiftfullThinkingBootcamp
//
//  Created by Furkan Açıkgöz on 20.07.2024.
//

import Foundation

struct ItemModel: Identifiable {
    let id: String = UUID().uuidString
    let title: String
    let isCompleted: Bool
}
