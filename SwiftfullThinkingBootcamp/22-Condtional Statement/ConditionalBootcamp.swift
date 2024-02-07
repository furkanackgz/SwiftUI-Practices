//
//  ConditionalBootcamp.swift
//  SwiftfullThinkingBootcamp
//
//  Created by Furkan Açıkgöz on 7.02.2024.
//

import SwiftUI

struct ConditionalBootcamp: View {
    @State var showPreview: Bool = false
    
    var body: some View {
        if showPreview {
            ProgressView()
        } else {
            RoundedRectangle(cornerRadius: 25.0)
                .fill(.orange)
                .frame(width: 100, height: 100)
        }
        
        Button("Show or hide preview") {
            showPreview.toggle()
        }
    }
}

#Preview {
    ConditionalBootcamp()
}
