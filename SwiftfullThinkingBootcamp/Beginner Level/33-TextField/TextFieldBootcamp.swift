//
//  TextFieldBootcamp.swift
//  SwiftfullThinkingBootcamp
//
//  Created by Furkan Açıkgöz on 6.03.2024.
//

import SwiftUI

struct TextFieldBootcamp: View {
    
    @State var textFieldText: String = ""
    @State var dataArray = [String]()
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Type something here...", text: $textFieldText)
                    .padding()
                    .background(
                        Color.purple.opacity(0.3).clipShape(RoundedRectangle(cornerRadius: 8.0))
                    )
                    .foregroundStyle(Color.red)
                    .font(.headline)
                
                Button("Save".uppercased()) {
                    save()
                }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(
                        checkIfTextProper() ? Color.blue : Color.gray
                    )
                    .clipShape(RoundedRectangle(cornerRadius: 8.0))
                    .foregroundStyle(Color.white)
                    .font(.headline)
                    .disabled(checkIfTextProper() == false)
                
                ForEach(dataArray, id: \.self) { data in
                    Text(data)
                        .font(.headline)
                        .foregroundStyle(.purple)
                }
                
                Spacer()
            }
            .padding()
            .navigationTitle("TextField Bootcamp")
        }
    }
}

private extension TextFieldBootcamp {
    func save() {
        if checkIfTextProper() {
            dataArray.append(textFieldText)
            textFieldText = ""
        }
    }
    
    func checkIfTextProper() -> Bool {
        textFieldText.count >= 3
    }
}

#Preview {
    TextFieldBootcamp()
}
