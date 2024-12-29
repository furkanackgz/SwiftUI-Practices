//
//  SwiftfullThinkingBootcampApp.swift
//  SwiftfullThinkingBootcamp
//
//  Created by Furkan Açıkgöz on 7.01.2024.
//

import SwiftUI

@main
struct SwiftfullThinkingBootcampApp: App {
    
    @StateObject private var dataManager = DataManager()
    
    var body: some Scene {
        WindowGroup {
            FileManagerBootcamp()
                .environment(\.managedObjectContext, dataManager.container.viewContext)
        }
    }
}
