//
//  EscapingClosureBootcamp.swift
//  SwiftfullThinkingBootcamp
//
//  Created by Furkan Açıkgöz on 15.12.2024.
//

import SwiftUI

class EscapingClosureViewModel: ObservableObject {
    @Published var data: String = "Data"
    
    func fetchData() {
        downloadDataWithEscapingClosure2 { [weak self] newData in
            self?.data = newData
        }
    }
    
    private func downloadData() -> String {
        return "New Data"
    }
    
    private func downloadDataWithClosure(_ closure: (String) -> ()) {
        let newData = "New Data"
        closure(newData)
    }
    
    private func downloadDataWithEscapingClosure(_ closure: @escaping (String) -> ()) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            let newData = "New Data"
            closure(newData)
        }
    }
    
    private func downloadDataWithEscapingClosure2(_ closure: @escaping EscapingClosure) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            let newData = "New Data"
            closure(newData)
        }
    }
}

typealias EscapingClosure = (String) -> ()

struct EscapingClosureBootcamp: View {
    
    @StateObject var vm = EscapingClosureViewModel()
    
    var body: some View {
        Text(vm.data)
            .font(.largeTitle)
            .fontWeight(.semibold)
            .onTapGesture {
                vm.fetchData()
            }
    }
}

#Preview {
    EscapingClosureBootcamp()
}
