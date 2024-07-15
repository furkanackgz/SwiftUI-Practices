//
//  ForEachBootcamp.swift
//  SwiftfullThinkingBootcamp
//
//  Created by Furkan Açıkgöz on 22.01.2024.
//

import SwiftUI

struct ForEachBootcamp: View {
    let strings = ["Hi", "Hello", "Hey everyone"]
    
    var body: some View {
        VStack(alignment: .leading) {
            ForEach(strings, id: \.self) { string in
                Text(string)
            }
        }
    }
}

#Preview {
    ForEachBootcamp()
}
