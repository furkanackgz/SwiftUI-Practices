//
//  SheetVsTransitionVsAnimation.swift
//  SwiftfullThinkingBootcamp
//
//  Created by Furkan Açıkgöz on 25.02.2024.
//

import SwiftUI

struct SheetVsTransitionVsAnimation: View {
    
    @State private var showSheet: Bool = false
    
    var body: some View {
        ZStack {
            Color.purple.ignoresSafeArea()
            
            Button {
                showSheet.toggle()
            } label: {
                Text("Show Sheet")
                    .foregroundStyle(.purple)
                    .fontWeight(.medium)
                    .padding(20)
                    .background(
                        Color.white
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                    )
            }
            // Sheet
//            .sheet(isPresented: $showSheet, content: {
//                NewScreen()
//            })
            
            // Transition
            ZStack {
                if showSheet {
                    NewScreen(showSheet: $showSheet)
                        .transition(.move(edge: .bottom))
                        .padding(.top, 100)
                }
            }
            .animation(.spring, value: showSheet)
            .zIndex(2.0)
            
            // Animation
//            GeometryReader { geometry in
//                NewScreen(showSheet: $showSheet)
//                    .offset(y: showSheet ? 100 : (geometry.size.height + geometry.safeAreaInsets.bottom))
//                    .animation(.spring, value: showSheet)
//            }
        }
    }
}

struct NewScreen: View {
    
    // Sheet
//    @Environment(\.dismiss) private var dismiss
    
    // Transition
    @Binding var showSheet: Bool
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            Color.orange.ignoresSafeArea()
            
            Button(action: {
                showSheet.toggle()
            }, label: {
                Image(systemName: "xmark")
                    .foregroundStyle(.black)
                    .font(.title)
                    .padding(20)
            })
        }
    }
}

#Preview {
    SheetVsTransitionVsAnimation()
}
