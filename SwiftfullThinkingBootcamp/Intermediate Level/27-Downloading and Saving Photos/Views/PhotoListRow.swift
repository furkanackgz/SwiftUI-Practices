//
//  PhotoListRow.swift
//  SwiftfullThinkingBootcamp
//
//  Created by Furkan Açıkgöz on 29.12.2024.
//

import SwiftUI

struct PhotoListRow: View {
    
    private let title: String
    private let url: String
    private let key: Int
    
    init(title: String, url: String, key: Int) {
        self.title = title
        self.url = url
        self.key = key
    }
    
    var body: some View {
        HStack(spacing: 8) {
            Photo(urlString: url, key: key)
                .frame(width: 75, height: 75)
            
            VStack(alignment: .leading, spacing: 8) {
                Text(title.capitalized)
                    .font(.headline)
                
                Text(url)
                    .foregroundStyle(.gray)
                    .italic()
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

#Preview {
    PhotoListRow(title: "Title", url: "Url", key: 1)
}
