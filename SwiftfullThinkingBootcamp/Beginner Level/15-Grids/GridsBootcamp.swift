//
//  GridsBootcamp.swift
//  SwiftfullThinkingBootcamp
//
//  Created by Furkan Açıkgöz on 23.01.2024.
//

import SwiftUI

struct GridsBootcamp: View {
    
    let columns: [GridItem] = [
        GridItem(.flexible(), spacing: 6, alignment: .center),
        GridItem(.flexible(), spacing: 6, alignment: .center),
        GridItem(.flexible(), spacing: 6, alignment: .center)
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(
                columns: columns,
                spacing: 6,
                pinnedViews: [.sectionHeaders],
                content: {
                    Section {
                        ForEach(0..<20) { _ in
                            Rectangle()
                                .fill(.blue)
                                .frame(height: 125)
                        }
                    } header: {
                        Text("Section 1")
                            .font(.title)
                            .foregroundStyle(.orange)
                            .frame(maxWidth: .infinity)
                            .background(.green)
                            .clipShape(RoundedRectangle(cornerRadius: 8.0))
                            .padding()
                    }
                    
                    Section() {
                        ForEach(0..<20) { _ in
                            Rectangle()
                                .fill(.blue)
                                .frame(height: 125)
                        }
                    } header: {
                        Text("Section 2")
                            .font(.title)
                            .foregroundStyle(.orange)
                            .frame(maxWidth: .infinity)
                            .background(.green)
                            .clipShape(RoundedRectangle(cornerRadius: 8.0))
                            .padding()
                            
                    }
                }
            )
        }
    }
}

#Preview {
    GridsBootcamp()
}
