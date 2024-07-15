//
//  EnvironmentObjectBootcamp.swift
//  SwiftfullThinkingBootcamp
//
//  Created by Furkan Açıkgöz on 23.03.2024.
//

import SwiftUI

class EnvironmentViewModel: ObservableObject {
    @Published var devices: [String] = []
    
    init() {
        getData()
    }
    
    private func getData() {
        devices.append(contentsOf: ["iPhone", "iPad", "iMac"])
    }
}

struct EnvironmentObjectBootcamp: View {
    
    @StateObject var viewModel = EnvironmentViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.devices, id: \.self) { device in
                    NavigationLink(device, destination: EnvironmentSecondScreen(device: device))
                }
            }
            .navigationTitle("Apple Devices")
        }
        .environmentObject(viewModel)
    }
}

struct EnvironmentSecondScreen: View {
    
    let device: String
    
    var body: some View {
        ZStack {
            // background
            Color.orange.ignoresSafeArea()
            
            // foreground
            NavigationLink(destination: EnvironmentThirdScreen()) {
                Text(device)
                    .font(.headline)
                    .foregroundStyle(.orange)
                    .background {
                        Color.white
                            .frame(width: 150, height: 75)
                            .clipShape(RoundedRectangle(cornerRadius: 25.0))
                    }
            }
        }
    }
}

struct EnvironmentThirdScreen: View {
    
    @EnvironmentObject var viewModel: EnvironmentViewModel
    
    var body: some View {
        ZStack {
            //background
            LinearGradient(gradient: Gradient(colors: [Color.red, Color.blue]),
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing)
            .ignoresSafeArea()
            
            // foreground
            VStack {
                ForEach(viewModel.devices, id: \.self) { device in
                    Text(device)
                }
                .foregroundStyle(.white)
                .font(.headline)
            }
        }
    }
}

#Preview {
    EnvironmentObjectBootcamp()
}
