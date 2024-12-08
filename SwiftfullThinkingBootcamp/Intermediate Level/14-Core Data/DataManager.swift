//
//  DataManager.swift
//  SwiftfullThinkingBootcamp
//
//  Created by Furkan Açıkgöz on 8.12.2024.
//

import CoreData
import Foundation

class DataManager: ObservableObject {
    
    let container: NSPersistentContainer = NSPersistentContainer(name: "DataModel")
    
    init() {
        container.loadPersistentStores { description, error in
            if let error {
                print("error laoding data: \(error.localizedDescription)")
            }
        }
    }
}
