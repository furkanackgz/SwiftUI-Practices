//
//  ScrollViewPagingBootcamp.swift
//  SwiftfullThinkingBootcamp
//
//  Created by Furkan Açıkgöz on 31.12.2024.
//

import SwiftUI

struct ScrollViewPagingBootcamp: View {
    var body: some View {
        HorizontalPagingScrollWithTransition()
    }
}

struct HorizontalPagingScrollWithTransition: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 40) {
                ForEach(0..<10) { int in
                    Rectangle()
                        .frame(width: 300, height: 300)
                        .padding(10)
                    // .scrollTransition(.interactive.threshold(.visible(0.3))) { content, phase in
                        .scrollTransition { content, phase in
                            content
                                .offset(y: phase.isIdentity ? 0 : -100)
                                .opacity(phase.isIdentity ? 1 : 0.2)
                        }
                }
            }
        }
        .scrollTargetLayout()
        .scrollTargetBehavior(.viewAligned)
    }
}

struct HorizontalPagingScrollToBehaviorExample: View {
    
    @State private var scrollPosition: Int?
    
    var body: some View {
        VStack(spacing: 32) {
            Button("Scroll To") {
                scrollPosition = (0...10).randomElement() ?? 0
            }
            .buttonStyle(.borderedProminent)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 0) {
                    ForEach(0..<10) { index in
                        Rectangle()
                            .frame(width: 300, height: 300)
                            .containerRelativeFrame(.horizontal)
                            .overlay {
                                Text("\(index)")
                                    .foregroundStyle(.white)
                                    .font(.largeTitle)
                            }
                            .id(index)
                    }
                }
            }
            .scrollTargetLayout()
            .scrollTargetBehavior(.paging)
            .scrollPosition(id: $scrollPosition, anchor: .center)
            .animation(.easeInOut, value: scrollPosition)
        }
    }
}

struct HorizontalPagingScrollViewExample: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 0) {
                ForEach(0..<10) { index in
                    Rectangle()
                        .frame(width: 300, height: 300)
                        .containerRelativeFrame(.horizontal, alignment: .center)
                }
            }
            .background(.orange)
        }
        .background(.green)
        .scrollTargetLayout()
        .scrollTargetBehavior(.paging)
    }
}

struct TikTokPagingViewExample: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                ForEach(0..<10) { index in
                    Rectangle()
                        .padding(.vertical, 10)
                        .containerRelativeFrame(.vertical, alignment: .center)
                        .overlay(alignment: .center) {
                            Text("\(index)")
                                .foregroundStyle(.white)
                                .font(.largeTitle)
                        }
                }
            }
        }
        .ignoresSafeArea()
        .scrollBounceBehavior(.basedOnSize, axes: .vertical)
        .scrollTargetLayout()
        .scrollTargetBehavior(.paging)
    }
}

#Preview {
    ScrollViewPagingBootcamp()
}
