//
//  DocumentationBootcamp.swift
//  SwiftfullThinkingBootcamp
//
//  Created by Furkan Açıkgöz on 10.03.2024.
//

import SwiftUI

struct DocumentationBootcamp: View {
    
    // MARK: Properties
    
    @State var showAlert: Bool = false
    @Environment(\.dismiss) var dismiss
    
    // MARK: Body
    
    // Furkan - Add button to scroll view
    /*
     1) Add button
     */
    var body: some View {
        NavigationView {
            ZStack {
                // Background
                Color.orange.ignoresSafeArea()
                
                // Foreground
                foregroundLayer
            }
            .navigationTitle("Documentation")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Alert") {
                        showAlert = true
                    }
                    .font(.headline)
                    .tint(.white)
                }
            }
            .alert("Alert", isPresented: $showAlert) {
                alertAction()
            }
        }
    }
    
    // MARK: Functions
    
    /// Foreground layer that holds Scroll View
    private var foregroundLayer: some View {
        ScrollView {
            VStack {
                Text("Hi")
                Text("This is Furkan Açıkgöz")
                Text("Welcome")
            }
            .font(.headline)
            .padding(.vertical, 30)
        }
    }
    
    /// Function that creates alert action view.
    ///
    /// This function is created for keeping body part of the view simple.
    ///
    /// ```
    /// alertAction() -> Button()
    /// ```
    ///
    /// - Warning: This function does not get parameter!
    /// - Returns: Return view that represents button or buttons of an alert.
    private func alertAction() -> some View {
        Button {
            dismiss()
        } label: {
            Text("OK")
        }

    }
}

#Preview {
    DocumentationBootcamp()
}
