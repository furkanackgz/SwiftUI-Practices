//
//  SubmitButtonBootcamp.swift
//  SwiftfullThinkingBootcamp
//
//  Created by Furkan Açıkgöz on 19.06.2024.
//

import SwiftUI

struct SubmitButtonBootcamp: View {
    
    @State private var text: String = ""
    
    var body: some View {
        TextField("Placeholder...", text: $text)
            .onSubmit {
                print("something to console")
            }
            .submitLabel(.next)
        
        TextField("Placeholder...", text: $text)
            .onSubmit {
                print("something to console")
            }
            .submitLabel(.route)
        
        TextField("Placeholder...", text: $text)
            .onSubmit {
                print("something to console")
            }
            .submitLabel(.continue)
    }
}

#Preview {
    SubmitButtonBootcamp()
}
