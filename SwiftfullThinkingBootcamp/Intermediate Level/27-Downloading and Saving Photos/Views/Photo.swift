//
//  Photo.swift
//  SwiftfullThinkingBootcamp
//
//  Created by Furkan Açıkgöz on 29.12.2024.
//

import SwiftUI

struct Photo: View {
    
    @StateObject private var vm: PhotoViewModel
    
    init(urlString: String, key: Int) {
        _vm = StateObject(wrappedValue: PhotoViewModel(urlString: urlString, key: key))
    }
    
    var body: some View {
        ZStack {
            if let uiimage = vm.image {
                Image(uiImage: uiimage)
                    .resizable()
                    .clipShape(Circle())
            } else {
                ProgressView()
            }
        }
    }
}

#Preview {
    Photo(urlString: "https://via.placeholder.com/600/92c952", key: 1)
}
