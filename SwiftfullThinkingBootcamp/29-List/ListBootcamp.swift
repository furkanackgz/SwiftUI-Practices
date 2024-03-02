//
//  ListBootcamp.swift
//  SwiftfullThinkingBootcamp
//
//  Created by Furkan Açıkgöz on 2.03.2024.
//

import SwiftUI

struct ListBootcamp: View {
    
    @State var fruits = [
        "apple", "banana", "orange", "peach"
    ]
    
    @State var veggies = [
        "tomato", "potato", "cucumber"
    ]
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    ForEach(fruits, id: \.self) { fruit in
                        Text(fruit.capitalized)
                            .foregroundStyle(Color.white)
                            .padding(.vertical)
                    }
                    .onDelete(perform: { indexSet in
                        delete(atOffsets: indexSet,
                               in: &fruits)
                    })
                    .onMove(perform: { indices, newOffset in
                        move(fromOffsets: indices,
                             toOffset: newOffset,
                             in: &fruits)
                    })
                    .listRowBackground(Color.blue)
                } header: {
                    HStack {
                        Text("Fruits")
                        Image(systemName: "flame")
                    }
                    .foregroundStyle(Color.orange)
                    .font(.callout)
                }
                
                
                Section {
                    ForEach(veggies, id: \.self) { veggie in
                        Text(veggie)
                    }
                    .onDelete(perform: { indexSet in
                        delete(atOffsets: indexSet,
                               in: &veggies)
                    })
                    .onMove(perform: { indices, newOffset in
                        move(fromOffsets: indices,
                             toOffset: newOffset,
                             in: &veggies)
                    })
                    .listRowBackground(Color.orange)
                } header: {
                    HStack {
                        Text("Veggies")
                        Image(systemName: "flame")
                    }
                    .foregroundStyle(Color.blue)
                    .font(.callout)
                }
            }
            .navigationTitle("List of Fruits")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) { EditButton()
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Add") {
                        fruits.append("black berry")
                    }
                }
            }
        }
        .tint(.purple)
    }
    
    private func delete(atOffsets: IndexSet, in array: inout [String]) {
        array.remove(atOffsets: atOffsets)
    }
    
    private func move(fromOffsets: IndexSet, toOffset: Int, in array: inout [String]) {
        array.move(fromOffsets: fromOffsets,
                    toOffset: toOffset)
    }
}

#Preview {
    ListBootcamp()
}
