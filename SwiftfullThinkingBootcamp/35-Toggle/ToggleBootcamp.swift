//
//  ToggleBootcamp.swift
//  SwiftfullThinkingBootcamp
//
//  Created by Furkan Açıkgöz on 7.03.2024.
//

import SwiftUI

struct ToggleBootcamp: View {
    
    @State var isToggleOn: Bool = false
    
    var body: some View {
        VStack {
            HStack {
                Text("Status: ")
                Text(isToggleOn ? "Online" : "Offline")
            }
            .font(.title)
            
            Toggle(isOn: $isToggleOn) {
                Text("Change status")
            }
            .tint(.purple)
            
            Spacer()
        }
        .padding(.horizontal, 100)
    }
}

#Preview {
    ToggleBootcamp()
}
