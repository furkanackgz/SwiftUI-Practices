//
//  MaskBootcamp.swift
//  SwiftfullThinkingBootcamp
//
//  Created by Furkan Açıkgöz on 31.10.2024.
//

import SwiftUI

struct MaskBootcamp: View {
    
    @State private var selectedStar: Int = 0
    
    var body: some View {
        starView
            .overlay {
                overlayView
                    .mask(starView)
            }
    }
}

// MARK: Components
private extension MaskBootcamp {
    var starView: some View {
        HStack {
            ForEach(1..<6) { index in
                Image(systemName: "star.fill")
                    .font(.largeTitle)
                    .foregroundStyle(.gray)
                    .onTapGesture {
                        withAnimation(.easeInOut) {
                            selectedStar = index
                        }
                    }
            }
        }
    }
    
    var overlayView: some View {
        GeometryReader { proxy in
            Rectangle()
                .fill(.blue)
                .allowsHitTesting(false)
                .frame(width: proxy.size.width * CGFloat(selectedStar) / 5)
        }
    }
}

#Preview {
    MaskBootcamp()
}
