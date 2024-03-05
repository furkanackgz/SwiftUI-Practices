//
//  AlertBootcamp.swift
//  SwiftfullThinkingBootcamp
//
//  Created by Furkan Açıkgöz on 4.03.2024.
//

import SwiftUI

struct AlertDetails: Identifiable {
    var id = UUID()
    var title: String
    var message: String
}

enum AlertType {
    case success
    case failure
}

struct AlertBootcamp: View {
    
    @State var showAlert: Bool = false
    @State var backgroundColor: Color = .yellow
    @State var alertDetails: AlertDetails?
    @State var alertType: AlertType?
    
    var body: some View {
        ZStack {
            backgroundColor.ignoresSafeArea()
            
            VStack {
                Button("Click for success") {
                    presentAlert(of: .success)
                }
                
                Button("Click for failure") {
                    presentAlert(of: .failure)
                }
            }
            .alert(Text(alertDetails?.title ?? ""),
                   isPresented: $showAlert,
                   presenting: alertDetails) { alertDetails in
                alertAction()
            } message: { alertDetails in
                Text(alertDetails.message)
            }
            
        }
    }
    
    func presentAlert(of type: AlertType) {
        alertType = type
        switch type {
        case .success:
            alertDetails = .init(title: "Success", message: "This is a succes message")
        case.failure:
            alertDetails = .init(title: "Failure", message: "This is a failure message")
        }
        showAlert = true
    }
    
    func alertAction() -> some View {
        switch alertType {
        case .success:
            return Button("Ok") {
                backgroundColor = .green
            }
        case .failure:
            return Button("Ok") {
                backgroundColor = .red
            }
        default:
            return Button("Ok") { }
        }
    }
}

#Preview {
    AlertBootcamp()
}
