//
//  ViewModelBootcamp.swift
//  SwiftfullThinkingBootcamp
//
//  Created by Furkan Açıkgöz on 23.03.2024.
//

import SwiftUI

struct Fruit: Identifiable {
    let id: String = UUID().uuidString
    var name: String
    var count: Int
}

class FruitsViewModel: ObservableObject {
    @Published var fruits: [Fruit] = []
    
    init() {
        getFruits()
    }
    
    private func getFruits() {
        let apple = Fruit(name: "Apple", count: 4)
        let banana = Fruit(name: "Banana", count: 8)
        let orange = Fruit(name: "Orange", count: 13)
        fruits.append(contentsOf: [apple, banana, orange])
    }
    
    func deleteFruits(atOffsets: IndexSet) {
        fruits.remove(atOffsets: atOffsets)
    }
}

struct ViewModelBootcamp: View {
    
    @StateObject var fruitsViewModel: FruitsViewModel = FruitsViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(fruitsViewModel.fruits) { fruit in
                    HStack {
                        Text("\(fruit.count)")
                            .foregroundStyle(.purple)
                        Text(fruit.name)
                            .font(.headline)
                    }
                }
                .onDelete(perform: fruitsViewModel.deleteFruits)
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink(destination: SecondViewModelScreen(fruitsViewModel: fruitsViewModel)) {
                        Image(systemName: "arrow.right")
                    }
                }
            }
            .navigationTitle("Fruits")
        }
    }
}

struct SecondViewModelScreen: View {
    
    @ObservedObject var fruitsViewModel: FruitsViewModel
    
    var body: some View {
        ZStack {
            Color.purple.ignoresSafeArea()
            
            VStack {
                ForEach(fruitsViewModel.fruits) {
                    Text($0.name)
                }
            }
        }
    }
}

#Preview {
    ViewModelBootcamp()
}
