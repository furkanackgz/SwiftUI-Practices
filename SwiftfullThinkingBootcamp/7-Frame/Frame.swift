//
//  Frame.swift
//  SwiftfullThinkingBootcamp
//
//  Created by Furkan Açıkgöz on 13.01.2024.
//

import SwiftUI

struct Frame: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .background(Color.green)
            .frame(width: 200, height: 200, alignment: .top)
            .background(Color.orange)
            .frame(width: 300, height: 300, alignment: .bottom)
            .background(Color.blue)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            .background(Color.red)
        
    }
}

#Preview {
    Frame()
}
