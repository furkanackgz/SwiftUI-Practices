//
//  AlignmentGuidesBootcamp.swift
//  SwiftfullThinkingBootcamp
//
//  Created by Furkan Açıkgöz on 31.12.2024.
//

import SwiftUI

struct AlignmentGuidesBootcamp: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Hello World")
                .background(.red)
                .alignmentGuide(.leading) { dimension in
                    return dimension.width * 0.5
                }
            
            Text("This is some other text")
                .background(.blue)
        }
        .background(.orange)
    }
}

struct AlignmentGuidesBootcampChild: View {
    var body: some View {
        VStack(alignment: .leading) {
            row(title: "Hi there", showIcon: false)
            row(title: "Hi there", showIcon: true)
            row(title: "Hi there", showIcon: false)
        }
        .padding()
        .background(
            Color.white
                .clipShape(RoundedRectangle(cornerRadius: 8))
        )
        .shadow(radius: 8)
        .padding(40)
    }
    
    private func row(title: String, showIcon: Bool) -> some View {
        HStack(spacing: 10) {
            if showIcon {
                Image(systemName: "info.circle")
                    .frame(width: 30, height: 30)
            }
            Text(title)
            Spacer()
        }
        .alignmentGuide(.leading) { _ in
            return showIcon ? 40 : 0
        }
    }
}

#Preview {
    AlignmentGuidesBootcampChild()
}
