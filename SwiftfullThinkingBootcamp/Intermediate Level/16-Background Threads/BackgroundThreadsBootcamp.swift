//
//  BackgroundThreadsBootcamp.swift
//  SwiftfullThinkingBootcamp
//
//  Created by Furkan Açıkgöz on 9.12.2024.
//

import SwiftUI

class BackgroundThreadsViewModel: ObservableObject {
    @Published var dataArray: [String] = []
    
    func fetchData() {
        DispatchQueue.global(qos: .background).async {
            let data = self.downloadData()
            DispatchQueue.main.async {
                self.dataArray = data
            }
        }
    }
    
    private func downloadData() -> [String] {
        var data = [String]()
        for x in 1..<100 {
            data.append("\(x)")
        }
        return data
    }
}

struct BackgroundThreadsBootcamp: View {
    
    @StateObject var vm = BackgroundThreadsViewModel()
    
    var body: some View {
        VStack {
            Button {
                vm.fetchData()
            } label: {
                Text("Load Data")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
            }
            
            ScrollView {
                VStack {
                    ForEach(vm.dataArray, id: \.self) { item in
                        Text(item)
                    }
                }
                .frame(maxWidth: .infinity)
            }
            .scrollIndicators(.hidden)
        }
    }
}

#Preview {
    BackgroundThreadsBootcamp()
}
