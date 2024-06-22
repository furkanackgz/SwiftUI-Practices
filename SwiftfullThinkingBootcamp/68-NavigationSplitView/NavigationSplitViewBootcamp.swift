//
//  NavigationSplitViewBootcamp.swift
//  SwiftfullThinkingBootcamp
//
//  Created by Furkan Açıkgöz on 22.06.2024.
//

import SwiftUI

enum Category: String, CaseIterable {
    case fruits
    case vegetables
    case Meats
}

enum FruitCategory: String, CaseIterable {
    case banana
    case apple
    case grape
}


struct NavigationSplitViewBootcamp: View {
    
    @State private var columnVisibility = NavigationSplitViewVisibility.all
    @State private var selectedCategory: Category?
    @State private var selectedFruitCategory: FruitCategory?
    
    var body: some View {
        NavigationSplitView(columnVisibility: $columnVisibility) {
            List(Category.allCases, id: \.rawValue,
                 selection: $selectedCategory) { category in
                NavigationLink(category.rawValue.capitalized, value: category)
            }
                 .navigationTitle("Categories")
        } content: {
            if let selectedCategory {
                Group {
                    switch selectedCategory {
                    case .fruits:
                        List(FruitCategory.allCases, id: \.rawValue,
                             selection: $selectedFruitCategory) { fruitCategory in
                            NavigationLink(fruitCategory.rawValue.capitalized,
                                           value: fruitCategory)
                        }
                    case .vegetables:
                        EmptyView()
                    case .Meats:
                        EmptyView()
                    }
                }
                     .navigationTitle(selectedCategory.rawValue.capitalized)
            } else {
                Text("Please select a category!")
            }
        } detail: {
            if let selectedFruitCategory {
                Text("You've selected \"\(selectedFruitCategory.rawValue.capitalized)\" ")
                    .font(.headline)
            }
        }

    }
}

#Preview {
    NavigationSplitViewBootcamp()
}
