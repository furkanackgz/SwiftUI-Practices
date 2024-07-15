//
//  PopoverBootcamp.swift
//  SwiftfullThinkingBootcamp
//
//  Created by Furkan Açıkgöz on 20.06.2024.
//

import SwiftUI

struct PopoverBootcamp: View {
    
    @State private var showPopover: Bool = false
    @State private var buttonTitles = [
        "Very good 😍", "Not bad 🙂", "Can be better ☹️"
    ]
    
    var body: some View {
        ZStack {
            Color.indigo.ignoresSafeArea()
            
            VStack {
                Spacer()
                
                Button {
                    showPopover.toggle()
                } label: {
                    Text("Click to comment")
                        .font(.headline)
                        .foregroundStyle(.indigo)
                        .padding()
                        .background(
                            Color.yellow
                                .clipShape(
                                    RoundedRectangle(cornerRadius: 8)
                                )
                        )
                }
                .popover(isPresented: $showPopover, attachmentAnchor: .point(.top)) {
                    ScrollView {
                        VStack(alignment: .leading, spacing: 15) {
                            ForEach(buttonTitles, id: \.self) { title in
                                Button {
                                    
                                } label: {
                                    Text(title)
                                }
                                
                                if title != buttonTitles.last {
                                    Divider()
                                }
                            }
                            
                        }
                    }
                    .padding()
                    .presentationCompactAdaptation(.popover)
                }
            }
        }
    }
}

#Preview {
    PopoverBootcamp()
}
