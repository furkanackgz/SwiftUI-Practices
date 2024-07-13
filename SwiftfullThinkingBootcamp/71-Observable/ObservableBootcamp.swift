//
//  ObservableBootcamp.swift
//  SwiftfullThinkingBootcamp
//
//  Created by Furkan Açıkgöz on 13.07.2024.
//

import SwiftUI

@Observable
class ObservedViewModel {
    var title: String = "Some Title"
    @ObservationIgnored var value: String = "Some Other Title"
}

struct ObservableBootcamp: View {
    
    @State private var viewModel = ObservedViewModel()
    
    var body: some View {
        VStack(spacing: 40) {
            Button(viewModel.title) {
                viewModel.title = "Base Title"
            }
            
            FirstChildView(viewModel: viewModel)
            
            SecondChildView()
        }
        .environment(viewModel)
    }
}

struct FirstChildView: View {
    
    @Bindable var viewModel: ObservedViewModel
    
    var body: some View {
        Button(viewModel.title) {
            viewModel.title = "First Child Title"
        }
    }
}

struct SecondChildView: View {
    
    @Environment(ObservedViewModel.self) var viewModel
    
    var body: some View {
        Button(viewModel.title) {
            viewModel.title = "Second Child Title "
        }
    }
}

#Preview {
    ObservableBootcamp()
}
