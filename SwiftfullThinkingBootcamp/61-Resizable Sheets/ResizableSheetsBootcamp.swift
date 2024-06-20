//
//  ResizableSheetsBootcamp.swift
//  SwiftfullThinkingBootcamp
//
//  Created by Furkan Açıkgöz on 20.06.2024.
//

import SwiftUI

struct ResizableSheetsBootcamp: View {
    
    @State private var showSheet: Bool = false
    
    var body: some View {
        Button("Show Sheet") {
            showSheet.toggle()
        }
        .sheet(isPresented: $showSheet) {
            MySheetView()
        }
    }
}

struct MySheetView: View {
    
    @State private var detent: PresentationDetent = .medium
    
    var body: some View {
        ZStack {
            Color.indigo.ignoresSafeArea()
            
            VStack(spacing: 20) {
                Button("%20") {
                    detent = .fraction(0.2)
                }
                
                Button("Medium") {
                    detent = .medium
                }
                
                Button("Large") {
                    detent = .large
                }
            }
            .foregroundStyle(.white)
            .font(.headline)
//            .presentationDetents([.medium])
            .presentationDetents([.fraction(0.2),
                                  .medium,
                                  .large],
                             selection: $detent)
            .presentationDragIndicator(.visible)
//            .interactiveDismissDisabled(true)
            .presentationBackground {
                Color.indigo
                    .padding(.bottom, -1000)
            }
        }
    }
}

#Preview {
    ResizableSheetsBootcamp()
}
