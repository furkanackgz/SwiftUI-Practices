//
//  ButtonBootcamp.swift
//  SwiftfullThinkingBootcamp
//
//  Created by Furkan Açıkgöz on 28.01.2024.
//

import SwiftUI

struct ButtonBootcamp: View {
    
    @State var title = "Title"
    
    var body: some View {
        VStack(spacing: 20) {
            Text(title)
            
            Button("Press me!") {
                title = "Button #1 is pressed"
            }
            .tint(.red)
            
            Button(action: {
                title = "Button #2 is pressed"
            }, label: {
                RoundedRectangle(cornerRadius: 8.0)
                    .frame(width: 100, height: 50)
                    .overlay {
                        Text("SAVE")
                            .fontWeight(.semibold)
                            .foregroundStyle(.white)
                    }
                    .shadow(radius: 10)
            })
            
            Button {
                title = "Button #3 is pressed"
            } label: {
                Circle()
                    .fill(.white)
                    .frame(width: 75)
                    .shadow(radius: 10)
                    .overlay {
                        Image(systemName: "heart.fill")
                            .font(.largeTitle)
                            .foregroundStyle(.red)
                    }
            }
            
            Button {
                title = "Button #4 is pressed"
            } label: {
                Text("Finish".uppercased())
                    .font(.caption)
                    .foregroundStyle(.gray)
                    .fontWeight(.bold)
                    .padding()
                    .padding(.horizontal, 10)
                    .background(
                        Capsule()
                            .stroke(.gray, lineWidth: 3)
                    )
            }

        }
    }
}

#Preview {
    ButtonBootcamp()
}
