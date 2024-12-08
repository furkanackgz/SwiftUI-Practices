//
//  CoreDataBootcamp.swift
//  SwiftfullThinkingBootcamp
//
//  Created by Furkan Açıkgöz on 8.12.2024.
//

import SwiftUI

struct CoreDataBootcamp: View {
    
    @Environment(\.managedObjectContext) var context
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \FruitEntity.name,
                                           ascending: true)]
    )
    private var fruits: FetchedResults<FruitEntity>
    @State private var textFieldText: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                textField
                submitButton
                listView
            }
            .navigationTitle("Fruits")
        }
    }
}

// MARK: Components
private extension CoreDataBootcamp {
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
        Button(action: submitButtonAction) {
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
            ForEach(fruits) { fruit in
                Text(fruit.name ?? "")
                    .onTapGesture {
                        listTapAction(with: fruit)
                    }
            }
            .onDelete(perform: listDeleteAction)
        }
    }
}

private extension CoreDataBootcamp {
    func submitButtonAction() {
        if textFieldText != "" {
            let newFruit = FruitEntity(context: context)
            newFruit.name = textFieldText
            saveContext()
            textFieldText = ""
        }
    }
    
    func listDeleteAction(with indexSet: IndexSet) {
        guard let index = indexSet.first else { return }
        let fruit = fruits[index]
        context.delete(fruit)
        saveContext()
    }
    
    func listTapAction(with fruit: FruitEntity) {
        let prevName = fruit.name ?? ""
        fruit.name = prevName + "!"
        saveContext()
    }
    
    func saveContext() {
        do {
            if context.hasChanges {
                try context.save()
            }
        } catch {
            fatalError("Error for saving data to context \(error.localizedDescription)")
        }
    }
}

#Preview {
    CoreDataBootcamp()
}
