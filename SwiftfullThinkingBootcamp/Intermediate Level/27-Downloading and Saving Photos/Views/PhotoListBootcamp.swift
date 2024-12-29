//
//  PhotoListBootcamp.swift
//  SwiftfullThinkingBootcamp
//
//  Created by Furkan Açıkgöz on 29.12.2024.
//

import SwiftUI

struct PhotoListBootcamp: View {
    
    @StateObject private var vm = PhotoListViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(vm.photoList) { model in
                    PhotoListRow(title: model.title, url: model.url, key: model.id)
                }
            }
            .listStyle(.plain)
            .navigationTitle("Photo List")
        }
    }
}

#Preview {
    PhotoListBootcamp()
}
