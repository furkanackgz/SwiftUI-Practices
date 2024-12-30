//
//  AccessibilityTextAndIconBootcamp.swift
//  SwiftfullThinkingBootcamp
//
//  Created by Furkan Açıkgöz on 30.12.2024.
//

import SwiftUI

struct AccessibilityTextAndIconBootcamp: View {
    
    @Environment(\.dynamicTypeSize) var dynamicTypeSize
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(0..<10) { _ in
                    VStack(alignment: .leading) {
                        HStack {
                            Image(systemName: "heart.fill")
//                                .font(.system(size: 20))
                            Text("Welcome to my App")
                                .font(.title)
                                .lineLimit(2)
                                .minimumScaleFactor(dynamicTypeSize.customSizeForTitle)
                        }
                        
                        Text("This is some random text that expands to multiple lines.")
                            .font(.subheadline)
                            .lineLimit(3)
                            .minimumScaleFactor(dynamicTypeSize.customSizeForDescription)
                    }
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(.red)
                }
            }
            .navigationTitle("Accessibility")
            .listStyle(.plain)
        }
    }
}

extension DynamicTypeSize {
    var customSizeForTitle: CGFloat {
        switch self {
        case .xSmall, .small, .medium:
            1
        default:
            0.9
        }
    }
    
    var customSizeForDescription: CGFloat {
        switch self {
        case .xSmall, .small, .medium:
            1
        case .large, .xLarge, .xxLarge, .xxxLarge:
            0.9
        default:
            0.7
        }
    }
}

#Preview {
    AccessibilityTextAndIconBootcamp()
}
