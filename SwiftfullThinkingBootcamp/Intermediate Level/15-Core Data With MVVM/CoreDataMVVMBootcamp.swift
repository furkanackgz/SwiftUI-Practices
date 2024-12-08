//
//  CoreDataMVVMBootcamp.swift
//  SwiftfullThinkingBootcamp
//
//  Created by Furkan Açıkgöz on 8.12.2024.
//

import CoreData
import SwiftUI

class CoreDataMVVMViewModel: ObservableObject {
    
    @Published var fruits: [FruitEntity] = []
    private let container: NSPersistentContainer
    
    init() {
        container = NSPersistentContainer(name: "DataModel")
        container.loadPersistentStores { description, error in
            if let error {
                print("Cannot load container, error: \(error.localizedDescription)")
            }
        }
        fetchFruits()
    }
    
    func addFruit(with name: String) {
        guard name.isEmpty == false else { return }
        let newFruit = FruitEntity(context: container.viewContext)
        newFruit.name = name
        saveContext()
    }
    
    func updateFruit(with fruit: FruitEntity) {
        let currentName = fruit.name ?? ""
        let newName = currentName + "!"
        fruit.name = newName
        saveContext()
    }
    
    func deleteFruit(with indexSet: IndexSet) {
        guard let index = indexSet.first else { return }
        let fruit = fruits[index]
        container.viewContext.delete(fruit)
        saveContext()
    }
    
    private func fetchFruits() {
        let request = NSFetchRequest<FruitEntity>(entityName: "FruitEntity")
        request.sortDescriptors = [NSSortDescriptor(keyPath: \FruitEntity.name,
                                                    ascending: true)]
        do {
            fruits = try container.viewContext.fetch(request)
        } catch {
            print("Error fetching data, error: \(error.localizedDescription)")
        }
    }
    
    private func saveContext() {
        do {
            try container.viewContext.save()
            fetchFruits()
        } catch {
            print("Error saving context, error: \(error.localizedDescription)")
        }
    }
}

struct CoreDataMVVMBootcamp: View {
    
    @StateObject private var vm = CoreDataMVVMViewModel()
    @State private var textFieldText: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                textField
                submitButton
                listView
            }
            .navigationTitle("MVVM Fruits")
        }
    }
}

// MARK: Components
private extension CoreDataMVVMBootcamp {
    var textField: some View {
        TextField("Add fruit here...", text: $textFieldText)
            .font(.headline)
            .padding(.leading)
            .frame(maxWidth: .infinity)
            .frame(height: 55)
            .background(
                Color.gray.opacity(0.3)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
            )
            .padding(.horizontal)
    }
    
    var submitButton: some View {
        Button {
            vm.addFruit(with: textFieldText)
            textFieldText = ""
        } label: {
            Text("Submit")
                .font(.headline)
                .foregroundStyle(Color.white)
                .frame(maxWidth: .infinity)
                .frame(height: 55)
                .background(
                    Color.blue
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                )
                .padding(.horizontal)
        }
    }
    
    var listView: some View {
        List {
            ForEach(vm.fruits) { fruit in
                Text(fruit.name ?? "")
                    .onTapGesture {
                        vm.updateFruit(with: fruit)
                    }
            }
            .onDelete(perform: vm.deleteFruit)
        }
    }
}

#Preview {
    CoreDataMVVMBootcamp()
}
