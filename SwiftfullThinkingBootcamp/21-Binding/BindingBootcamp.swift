//
//  BindingBootcamp.swift
//  SwiftfullThinkingBootcamp
//
//  Created by Furkan Açıkgöz on 7.02.2024.
//

import SwiftUI

struct BindingBootcamp: View {
    @State var title: String = "Title"
    @State var backgroundColor: Color = .green
    
    var body: some View {
        ZStack {
            backgroundColor
                .ignoresSafeArea()
            
            VStack {
                Text(title)
                    .foregroundStyle(.white)
                    .font(.title)
                
                ButtonView(title: $title,
                           backgroundColor: $backgroundColor)
            }
        }
    }
}

struct ButtonView: View {
    @Binding var title: String
    @Binding var backgroundColor: Color
    @State var buttonColor: Color = .red
    
    var body: some View {
        Button {
            title = "Button is tapped"
            backgroundColor = .orange
            buttonColor = .green
        } label: {
            Text("Button")
                .foregroundStyle(.white)
                .frame(width: 100, height: 50)
                .background(
                    buttonColor
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                )
        }

    }
}

#Preview {
    BindingBootcamp()
}
