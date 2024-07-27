//
//  ToDoAddView.swift
//  SwiftfullThinkingBootcamp
//
//  Created by Furkan Açıkgöz on 15.07.2024.
//

import SwiftUI

struct ToDoAddView: View {
    
    @State private var textFieldText: String = ""
    @State private var alertTitle: String = ""
    @State private var showAlert: Bool =  false
    @Environment(\.dismiss) var dismiss
    
    @ObservedObject var listService: ListService
    
    var body: some View {
        ScrollView {
            VStack(spacing: 12) {
                textField
                saveButton
            }
            .padding()
        }
        .navigationTitle("Add an Item ✏️")
        .alert(alertTitle, isPresented: $showAlert) {
            Button("Ok") { }
        }
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
        Button {
            saveButtonAction()
        } label: {
            Text("Save".uppercased())
                .font(.headline)
                .foregroundStyle(.white)
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                .background(.tint)
                .clipShape(RoundedRectangle(cornerRadius: 10))
        }
    }
}

// MARK: Methods
private extension ToDoAddView {
    func saveButtonAction() {
        if listService.checkIfItemTileIsAppropriate(textFieldText) {
            listService.createItemAndAddToList(title: textFieldText, isCompleted: false)
            dismiss()
        } else {
            alertTitle = "Please type at least 3 chracter long! ☹️"
            showAlert = true
        }
    }
}

#Preview {
    NavigationStack {
        ToDoAddView(listService: ListService())
    }
}
