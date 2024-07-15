//
//  AppStorageBootcamp.swift
//  SwiftfullThinkingBootcamp
//
//  Created by Furkan Açıkgöz on 24.03.2024.
//

import SwiftUI

struct AppStorageBootcamp: View {
    
    @AppStorage("name") var userName: String?
    
    var body: some View {
        VStack(spacing: 20) {
            Text(userName ?? "Enter name")
            
            Button("Save".uppercased()) {
                userName = "Furkan"
            }
        }
    }
}

#Preview {
    AppStorageBootcamp()
}
