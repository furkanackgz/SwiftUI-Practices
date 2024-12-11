//
//  WeakSelfBootcamp.swift
//  SwiftfullThinkingBootcamp
//
//  Created by Furkan Açıkgöz on 11.12.2024.
//

import SwiftUI

class WeakSelfViewModel: ObservableObject {
    @Published var data: String?
    
    init() {
        print("Initialized")
        getData()
        let count = UserDefaults.standard.integer(forKey: "count")
        UserDefaults.standard.set(count + 1, forKey: "count")
    }
    
    deinit {
        print("Deinitialized")
        let count = UserDefaults.standard.integer(forKey: "count")
        UserDefaults.standard.set(count - 1, forKey: "count")
    }
    
    func getData() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 500) { [weak self] in
            self?.data = "Data"
        }
    }
}

struct WeakSelfBootcamp: View {
    
    @AppStorage("count") var count: Int?
    
    init() {
        count = 0
    }
    
    var body: some View {
        NavigationView {
            NavigationLink {
                WeakSelfSecondScreen()
            } label: {
                Text("Second Screen")
            }
            .navigationTitle("First Screen")
        }
        .overlay(alignment: .topTrailing) {
            Text("\(count ?? 0)")
                .font(.largeTitle)
                .padding()
                .background(
                    Color.green
                        .clipShape(
                            RoundedRectangle(cornerRadius: 10)
                        )
                )
        }
    }
}

struct WeakSelfSecondScreen: View {
    
    @StateObject var vm = WeakSelfViewModel()
    
    var body: some View {
        Text("Second Screen")
            .font(.largeTitle)
        
        if let data = vm.data {
            Text(data)
        }
    }
}

#Preview {
    WeakSelfBootcamp()
}
