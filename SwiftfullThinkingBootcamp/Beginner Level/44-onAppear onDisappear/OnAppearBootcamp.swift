//
//  OnAppearBootcamp.swift
//  SwiftfullThinkingBootcamp
//
//  Created by Furkan Açıkgöz on 10.03.2024.
//

import SwiftUI

struct OnAppearBootcamp: View {
    
    @State var count: Int = 0
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack {
                    ForEach(1...20, id: \.self) { _ in
                        RoundedRectangle(cornerRadius: 25.0)
                            .frame(height: 400)
                            .padding()
                            .onAppear { // putting this modifier on different components will affect the completion to run on different time.
                                count += 1
                            }
                            .onDisappear { // putting this modifier on different components will affect the completion to run on different time.
                                count -= 1
                            }
                    }
                }
            }
            .navigationTitle("onAppear: \(count)")
        }
    }
}

#Preview {
    OnAppearBootcamp()
}
