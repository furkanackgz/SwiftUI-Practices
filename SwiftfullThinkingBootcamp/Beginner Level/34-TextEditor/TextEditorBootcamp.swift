//
//  TextEditorBootcamp.swift
//  SwiftfullThinkingBootcamp
//
//  Created by Furkan Açıkgöz on 6.03.2024.
//

import SwiftUI

struct TextEditorBootcamp: View {
    
    @State var textEditorText: String = ""
    @State var savedText: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                TextEditor(text: $textEditorText)
                    .foregroundStyle(.black)
                    .frame(height: 150)
                    .colorMultiply(.gray.opacity(0.6))
                    .clipShape(
                        RoundedRectangle(cornerRadius: 10)
                    )
                
                Button(action: {
                    savedText = textEditorText
                    textEditorText = ""
                }, label: {
                    Text("Save".uppercased())
                        .font(.headline)
                        .foregroundStyle(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(
                            Color.blue
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                        )
                })
                    
                Text(savedText)
                    .font(.headline)
                
                Spacer()
            }
            .padding()
            .navigationTitle("TextEditor Bootcamp")
        }
    }
}

#Preview {
    TextEditorBootcamp()
}
