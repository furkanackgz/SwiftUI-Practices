//
//  SwiftfullThinkingBootcampApp.swift
//  SwiftfullThinkingBootcamp
//
//  Created by Furkan Açıkgöz on 7.01.2024.
//

import SwiftUI

@main
struct SwiftfullThinkingBootcampApp: App {
    
    @StateObject private var listService: ListService = ListService()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                ToDoListView()
            }
            .environmentObject(listService)
        }
    }
}
