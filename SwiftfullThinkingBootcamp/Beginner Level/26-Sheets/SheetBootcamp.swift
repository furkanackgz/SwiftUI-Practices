//
//  SheetBootcamp.swift
//  SwiftfullThinkingBootcamp
//
//  Created by Furkan Açıkgöz on 25.02.2024.
//

import SwiftUI

struct SheetBootcamp: View {
    
    @State private var isPresented: Bool = false
    
    var body: some View {
        ZStack {
            Color.green.ignoresSafeArea()
            
            Button(action: {
                isPresented = true
            }, label: {
                Text("Button")
                    .foregroundStyle(.green)
                    .padding(20)
                    .background(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
            })
//            .sheet(isPresented: $isPresented, content: {
//                SheetScreen(isPresented: $isPresented)
//            })
            .fullScreenCover(isPresented: $isPresented, content: {
                FullScrenCoverScreen()
            })
        }
    }
}

struct SheetScreen: View {
    
    @Binding var isPresented: Bool
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            Color.orange.ignoresSafeArea()
            
            Button {
                isPresented = false
            } label: {
                Image(systemName: "xmark")
                    .foregroundStyle(.white)
                    .font(.title)
                    .padding(30)
            }
        }
    }
}

struct FullScrenCoverScreen: View {
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            Color.purple.ignoresSafeArea()

            Button {
                dismiss()
            } label: {
                Image(systemName: "xmark")
                    .foregroundStyle(.white)
                    .font(.title)
                    .padding(30)
            }
        }
    }
}

#Preview {
    SheetBootcamp()
}
