//
//  AccessibilityVoiceOver.swift
//  SwiftfullThinkingBootcamp
//
//  Created by Furkan Açıkgöz on 30.12.2024.
//

import SwiftUI

struct AccessibilityVoiceOver: View {
    
    @State private var isOn: Bool = false
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    Toggle("Volume", isOn: $isOn)
                    
                    HStack {
                        Text("Volume")
                        Spacer()
                        Text(isOn ? "On" : "Off")
                            .accessibilityHidden(true)
                    }
                    .background(Color.black.opacity(0.00001))
                    .onTapGesture {
                        isOn.toggle()
                    }
                    .accessibilityElement(children: .combine)
                    .accessibilityAddTraits(.isButton)
                    .accessibilityValue(isOn ? "is On" : "is off")
                    .accessibilityHint("Double tap to toggle setting.")
                    .accessibilityAction {
                        isOn.toggle()
                    }
                    
                } header: {
                    Text("Preferences")
                }

                Section {
                    Button("Favorites") {
                        
                    }
                    .accessibilityRemoveTraits(.isButton)
                    
                    Button {
                        
                    } label: {
                        Image(systemName: "heart.fill")
                    }
                    .accessibilityLabel("Favorites")
                    
                    Text("Favorites")
                        .onTapGesture {
                            
                        }
                        .accessibilityAddTraits(.isButton)

                } header: {
                    Text("Application")
                }
                
                VStack(alignment: .leading, spacing: 16) {
                    Text("CONTENT")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                        .accessibilityAddTraits(.isHeader)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(0..<10) { x in
                                VStack {
                                    Image("tesla")
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 100, height: 100)
                                        .clipShape(RoundedRectangle(cornerRadius: 8))
                                    
                                    Text("Tesla \(x)")
                                }
                                .accessibilityElement(children: .combine)
                                .accessibilityAddTraits(.isButton)
                                .accessibilityHint("Douple tap to enter")
                                .accessibilityLabel("Tesla \(x)")
                                .accessibilityAction {
                                    
                                }
                            }
                        }
                    }
                }
            }
            .navigationTitle("Settings")
        }
        .tint(.blue)
    }
}

#Preview {
    AccessibilityVoiceOver()
}
