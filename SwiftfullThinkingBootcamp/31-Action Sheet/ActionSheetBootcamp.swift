//
//  ActionSheetBootcamp.swift
//  SwiftfullThinkingBootcamp
//
//  Created by Furkan Açıkgöz on 6.03.2024.
//

import SwiftUI

enum ConfirmationDialogOptions {
    case myPost
    case otherPost
}

struct ActionSheetBootcamp: View {
    
    @State var showConfirmationDialog: Bool = false
    @State var confirmationDialogOption: ConfirmationDialogOptions = .myPost
    
    var body: some View {
        VStack {
            HStack {
                Circle()
                    .frame(width: 30, height: 30)
                Text("@username")
                Spacer()
                Button(action: {
                    confirmationDialogOption = .otherPost
                    showConfirmationDialog = true
                }, label: {
                    Image(systemName: "ellipsis")
                })
                .tint(.primary)
            }
            .padding(.horizontal)
            
            Rectangle()
                .aspectRatio(1, contentMode: .fit)
        }
        .confirmationDialog("What would you like to do?",
                            isPresented: $showConfirmationDialog,
                            actions: {
            getActions(for: confirmationDialogOption)
        })
    }
    
    private func getActions(for option: ConfirmationDialogOptions) -> some View {
        switch option {
        case .myPost:
            return VStack {
                Button("Share") { }
                Button("Delete", role: .destructive) { }
            }
        case .otherPost:
            return VStack {
                Button("Share") { }
                Button("Report", role: .destructive) { }
            }
        }
    }
}

#Preview {
    ActionSheetBootcamp()
}
