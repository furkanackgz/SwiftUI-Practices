//
//  Spacer_Bootcamp.swift
//  SwiftfullThinkingBootcamp
//
//  Created by Furkan Açıkgöz on 22.01.2024.
//

import SwiftUI

struct Spacer_Bootcamp: View {
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "xmark")
                Spacer()
                Image(systemName: "gear")
            }
            .font(.title)
            
            Spacer()
            
            Rectangle()
                .fill(.blue)
                .frame(height: 50)
            
        }
    }
}

#Preview {
    Spacer_Bootcamp()
}
