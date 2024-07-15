//
//  AnyLayoutBootcamp.swift
//  SwiftfullThinkingBootcamp
//
//  Created by Furkan Açıkgöz on 20.06.2024.
//

import SwiftUI

struct AnyLayoutBootcamp: View {
    
    @Environment(\.horizontalSizeClass) private var horizontalSizeClass
    @Environment(\.verticalSizeClass) private var verticalSizeClass
    
    var body: some View {
        VStack {
            Text(horizontalSizeClass.debugDescription)
            Text(verticalSizeClass.debugDescription)
            
            let layout: AnyLayout = (horizontalSizeClass == .compact) ? AnyLayout(VStackLayout()) : AnyLayout(HStackLayout())
            
            layout {
                Text("Alpha")
                Text("Betha")
                Text("Gamma")
            }
        }
    }
}

#Preview {
    AnyLayoutBootcamp()
}
