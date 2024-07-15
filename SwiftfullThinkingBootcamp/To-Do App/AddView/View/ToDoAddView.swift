//
//  ToDoAddView.swift
//  SwiftfullThinkingBootcamp
//
//  Created by Furkan Açıkgöz on 15.07.2024.
//

import SwiftUI

struct ToDoAddView: View {
    
    @State private var textFieldText: String = ""
    
    var body: some View {
        ScrollView {
            VStack(spacing: 12) {
                textField
                saveButton
            }
            .padding()
        }
        .navigationTitle("Add an Item ✏️")
    }
}

// MARK: Components
private extension ToDoAddView {
    var textField: some View {
        TextField("Type something here...", text: $textFieldText)
            .frame(height: 55)
            .padding(.leading)
            .background(.gray.opacity(0.3))
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
    
    var saveButton: some View {
        Button(action: {
            // TODO: Save action
        }, label: {
            Text("Save".uppercased())
                .font(.headline)
                .foregroundStyle(.white)
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                .background(.tint)
                .clipShape(RoundedRectangle(cornerRadius: 10))
        })
    }
}

#Preview {
    NavigationStack {
        ToDoAddView()
    }
}
